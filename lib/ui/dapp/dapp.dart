import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/model/dapp_model.dart';
import 'package:icpbox/services/dapp_service.dart';
import 'package:icpbox/ui/dapp/dapplist_page.dart';
import 'package:icpbox/ui/dapp/search_page.dart';
import 'package:icpbox/widgets/customized_view.dart';
import 'package:icpbox/widgets/my_classical.dart';
import 'package:icpbox/widgets/my_emptywidget.dart';
import 'package:icpbox/widgets/my_firstrefresh.dart';

import 'grid_page.dart';

///DAPP
class DappPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DappPage();
}

const _permissions = [Permissions.READ_EXTERNAL_STORAGE, Permissions.CAMERA];

const _permissionGroup = [PermissionGroup.Camera, PermissionGroup.Photos];

class _DappPage extends State<DappPage> with TickerProviderStateMixin {
  late EasyRefreshController _easyRefreshController;
  TabController? _tabController;

  List<Tab> tabs = [];
  List<Widget> list_hot = [];
  List<Widget> list_new = [];

  //输入监听
  TextEditingController? _controller;

  //扫码
  late FlutterScankit scanKit;
  String code = "";

  @override
  void initState() {
    super.initState();
    //数据请求
    // _getDataList();
    //输入监听
    _controller = TextEditingController();
    _controller?.addListener(() {});

    _easyRefreshController = EasyRefreshController();

    //扫码
    scanKit = FlutterScankit();
    scanKit.addResultListen((val) {
      // Fluttertoast.showToast(msg: "扫码返回：" + val.toString());
      EasyLoading.showToast("扫码返回：" + val.toString());
      setState(() {
        code = val;
      });
    });

    //权限
    FlutterEasyPermission().addPermissionCallback(
        onGranted: (requestCode, perms, perm) {
          startScan();
        },
        onDenied: (requestCode, perms, perm, isPermanent) {});
  }

  //数据请求
  Future _getDataList() async {
    try {
      //获取接口数据
      Map<String, dynamic> resut = await DappService().getDappList();
      DappModel model = DappModel.fromJson(resut);

      tabs.clear();
      list_hot.clear();
      list_new.clear();

      model.type!.forEach((MyType) {
        tabs.add(Tab(
          text: MyType.title,
        ));
      });
      model.hot!.forEach((Hot) {
        list_hot.add(
          InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
              children: <Widget>[
                // Image.network("imgs/icp.png", width: 30.0, height: 40.0),
                // 圆形图片
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    width: 40,
                    height: 40,
                    placeholder: "imgs/icp.png",
                    image: Hot.img!,
                    fit: BoxFit.cover,
                  ),
                ),

                Text(
                  Hot.name!,
                  style: TextStyle(fontSize: 10, color: Color(0xFF4F4F4F)),
                ),
              ],
            ),
            onTap: () {},
          ),
        );
      });
      model.news!.forEach((Hot) {
        list_new.add(
          InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
              children: <Widget>[
                // Image.network("imgs/icp.png", width: 30.0, height: 40.0),
                // 圆形图片
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    width: 40,
                    height: 40,
                    placeholder: "imgs/icp.png",
                    image: Hot.img!,
                    fit: BoxFit.cover,
                  ),
                ),

                Text(
                  Hot.name!,
                  style: TextStyle(fontSize: 10, color: Color(0xFF4F4F4F)),
                ),
              ],
            ),
            onTap: () {},
          ),
        );
      });
      //更新页面数据
      setState(() {
        if (_tabController == null) {
          //初始化
          _tabController = TabController(
            length: tabs.length,
            vsync: this,
            //默认选中第几项
            initialIndex: 0,
          );
          //切换监听
          _tabController!.addListener(() {
            // print("切换到了第${_tabController?.index}项");
          });
        }
      });
    } catch (e) {
      /*setState(() {
        error = true;
        // errorMsg = S().noData;
        errorMsg = "";
      });*/
    }
  }

//下拉刷新
  Future _onRefresh() async {
    await _getDataList();
    //重置刷新状态
    _easyRefreshController.resetLoadState();
  }

  /**
   * 生命周期-销毁
   */
  @override
  void dispose() {
    super.dispose();
    scanKit.dispose();
    _controller!.dispose();
    _tabController!.dispose();
  }

  /**
   * 直接调用扫码
   */
  Future<void> startScan() async {
    try {
      await scanKit.startScan(scanTypes: [ScanTypes.ALL]);
    } on PlatformException catch (e) {
      EasyLoading.showToast(e.message.toString());
      /*setState(() {
        err = true;
        errMsg = e.toString();
      });*/
    }
  }

  /**
   * 跳转自定义扫码页面
   */
  Future<void> newPage(BuildContext context) async {
    var code = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CustomizedView();
    }));

    setState(() {
      this.code = code ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //去掉阴影效果
        elevation: 0.0,
        centerTitle: true,
        //输入框
        title: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            //只读
            readOnly: true,
            //不可编辑
            // enableInteractiveSelection: false,
            onTap: () {
              //跳转
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));*/
              Navigator.of(context).pushNamed("Search");
            },
            maxLines: 1,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            //隐藏文本-密码
            // obscureText: true,
            //输入类型
            keyboardType: TextInputType.text,
            //键盘右下角按钮
            textInputAction: TextInputAction.search,
            //光标
            cursorColor: Colors.black,
            cursorWidth: 1,
            //关闭软键盘
            focusNode: FocusNode(),
            // cursorRadius: Radius.circular(15),
            //装饰器-有下划线
            decoration: InputDecoration(
              //不需要输入框下划线
              border: InputBorder.none,
              //提示
              hintText: S().sreachinfo,
              hintStyle:
                  const TextStyle(fontSize: 14, color: Color(0xFFC1C1C5)),
              //左边图标设置
              icon: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "imgs/ic_search.png",
                  width: 16,
                  height: 16,
                ),
              ),
              //输入里面输入文字内边距设置
              contentPadding: const EdgeInsets.only(
                  top: 0.0, left: -19.0, right: -19.0, bottom: 8.0),
            ),
            controller: _controller,
            onEditingComplete: () {
              //关闭软键盘
              FocusScope.of(context).requestFocus(FocusNode());
              //输入完成时
              EasyLoading.showToast(_controller!.text.toString());
              // Fluttertoast.showToast(msg: _controller!.text.toString());
              //清空输入框
              _controller?.text = "";
            },
          ),
        ),
        //右边动作按钮
        actions: [
          IconButton(
            onPressed: () async {
              /**
               * 扫码
               */
              if (!await FlutterEasyPermission.has(
                  perms: _permissions, permsGroup: _permissionGroup)) {
                FlutterEasyPermission.request(
                    perms: _permissions, permsGroup: _permissionGroup);
              } else {
                startScan();
                // newPage(context);
              }
            },
            icon: Image.asset("imgs/ic_scan.png", width: 30.0, height: 30.0),
          ),
        ],
      ),
      //FAB按钮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //按钮
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        heroTag: "dapp",
        //前景色
        // foregroundColor: Colors.transparent,
        //未点击的时候的阴影
        elevation: 0.0,
        //点击时阴影值，默认 12.0
        highlightElevation: 0.0,
        //点击事件回调
        onPressed: () {
          //跳转
          /*Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new PublshDappPage(),
                ));*/
          Navigator.of(context).pushNamed("PublshDapp");
        },
        child: const Image(
            height: 50.0, width: 50.0, image: AssetImage("imgs/ic_fabu.png")),
      ),
      body: EasyRefresh(
        controller: _easyRefreshController,
        firstRefreshWidget: MyFirstRefresh(),
        emptyWidget: MyEmptyWidget(
            tabs.isEmpty, () => _easyRefreshController.callRefresh()),
        //首次刷新
        firstRefresh: true,
        //刷新回调
        onRefresh: _onRefresh,
        //加载回调
        onLoad: null,
        //头部刷新布局
        header: MyClassicalHeader(),
        //底部加载更多布局
        footer: null,

        child: ListView(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                color: Colors.white,
                padding: EdgeInsets.only(left: 14, top: 7),
                child: Text(S().dapp1,
                    style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)))),
            Container(
              height: 150,
              child:
                  list_hot.isEmpty ? Container() : GridPage(children: list_hot),
            ),
            //分割线
            const Divider(
              //缩进
              // indent: 10.0,
              // endIndent: 20.0,
              //分割线高度
              height: 5.0,
              //分割线的厚度
              thickness: 5.0,
              color: Color(0xFFF7F7F7),
            ),
            Container(
                // width: MediaQuery.of(context).size.width,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 14, top: 7),
                child: Text(S().dapp2,
                    style: const TextStyle(
                        fontSize: 14, color: Color(0xFF4F4F4F)))),
            Container(
              height: 150,
              child:
                  list_new.isEmpty ? Container() : GridPage(children: list_new),
            ),
            //分割线
            const Divider(
              //缩进
              // indent: 10.0,
              // endIndent: 20.0,
              //分割线高度
              height: 5.0,
              //分割线的厚度
              thickness: 5.0,
              color: Color(0xFFF7F7F7),
            ),

            //横向tabs（灰色部分）
            Container(
              color: Colors.white,
              // padding: EdgeInsets.only(left: 20.0, right: 20.0),
              //修饰器-顶部圆角
              // decoration: BoxDecoration(
              //   color: Color(0xFFF3F6FC),
              //   borderRadius:
              //       BorderRadius.vertical(top: Radius.elliptical(30, 30)),
              // ),
              child: tabs.isEmpty
                  ? Container()
                  : TabBar(
                      controller: _tabController,
                      tabs: tabs,
                      //可滚动
                      isScrollable: true,
                      //选中文字大小
                      labelStyle: const TextStyle(fontSize: 12),
                      //未选中文字大小
                      unselectedLabelStyle: const TextStyle(fontSize: 12),
                    ),
            ),
            //分割线
            const Divider(
              //缩进
              // indent: 10.0,
              // endIndent: 20.0,
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            myListView(),
          ],
        ),
      ),
    );
  }
}

class myListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
        primary: true,
        //内容适配
        shrinkWrap: true,
        //item 数量
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: Image.asset("imgs/icp.png", width: 30, height: 30),
            title: Text("title",
                style: TextStyle(color: Color(0xFF687177), fontSize: 12.0)),
            // Expanded(child: Container()),
            subtitle: Text("content",
                style: TextStyle(color: Color(0xFFACAFB4), fontSize: 12.0)),
            //紧凑程度 -4 ~ 4
            visualDensity: VisualDensity(horizontal: -4.0),
          );
          /*return Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(18, 10, 10, 20),
            child: Row(
              //对齐方式
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "imgs/icp.png",
                  width: 44,
                  height: 44,
                ),
                SizedBox(width: 10), // 20宽度
                Text("ICP1",
                    style: TextStyle(fontSize: 14, color: Color(0xFF484848))),
                Spacer(), //使用Spacer填充尽可能大的空间
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("0",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF484848))),
                    Text("\$ 0",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFA7A7A7))),
                  ],
                ),
              ],
            ),
          );*/
        });
  }
}
