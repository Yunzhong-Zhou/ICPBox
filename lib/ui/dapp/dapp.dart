import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icpbox/widgets/customized_view.dart';

import 'grid_page.dart';
import 'publish_dapp.dart';

///DAPP
class DappPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DappPage();
}

const _permissions = const [
  Permissions.READ_EXTERNAL_STORAGE,
  Permissions.CAMERA
];

const _permissionGroup = const [PermissionGroup.Camera, PermissionGroup.Photos];

int _tab_index = 0;
List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class _DappPage extends State<DappPage> {
  //输入监听
  var _controller;

  //扫码
  late FlutterScankit scanKit;
  String code = "";

  @override
  void initState() {
    super.initState();
    //输入监听
    _controller = TextEditingController();
    _controller.addListener(() {});

    //扫码
    scanKit = FlutterScankit();
    scanKit.addResultListen((val) {
      Fluttertoast.showToast(msg: "扫码返回：" + val.toString());
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

  /**
   * 生命周期-销毁
   */
  @override
  void dispose() {
    scanKit.dispose();
    super.dispose();
  }

  /**
   * 直接调用扫码
   */
  Future<void> startScan() async {
    try {
      await scanKit.startScan(scanTypes: [ScanTypes.ALL]);
    } on PlatformException {}
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
            maxLines: 1,
            style: TextStyle(fontSize: 14, color: Colors.black),
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
              hintText: "请输入搜索内容",
              hintStyle: TextStyle(fontSize: 14, color: Color(0xFFC1C1C5)),
              //左边图标设置
              icon: Padding(
                padding: EdgeInsets.all(8),
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
              Fluttertoast.showToast(msg: _controller.text);
              //清空输入框
              _controller.text = "";
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
      body: Scaffold(
        //FAB按钮位置
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        //按钮
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          //前景色
          // foregroundColor: Colors.transparent,
          //未点击的时候的阴影
          elevation: 0.0,
          //点击时阴影值，默认 12.0
          highlightElevation: 0.0,
          //点击事件回调
          onPressed: () {
            //跳转
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new PublshDappPage(),
                ));
          },
          child: Image(
              height: 50.0, width: 50.0, image: AssetImage("imgs/ic_fabu.png")),
        ),
        /*body: CustomScrollView(
          scrollDirection: Axis.vertical,
          ///反弹效果
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverGridPage(children: _buildChildren()),
          ],
        ),*/
        body: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                color: Colors.white,
                padding: EdgeInsets.only(left: 14, top: 7),
                child: Text("热点项目",
                    style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)))),
            Container(
              height: 150,
              child: GridPage(children: _buildChildren()),
            ),
            //分割线
            Divider(
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
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                color: Colors.white,
                padding: EdgeInsets.only(left: 14, top: 7),
                child: Text("最新项目",
                    style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)))),
            Container(
              height: 150,
              child: GridPage(children: _buildChildren()),
            ),
            //分割线
            Divider(
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
              child: DefaultTabController(
                length: 6, // 定义tab数量
                child: TabBar(
                  // controller: _tabController,
                  //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
                  unselectedLabelColor: Color(0xFF878787),
                  //设置未选中时的字体样式，tabs里面的字体样式优先级最高
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                  //设置选中时的字体颜色，tabs里面的字体样式优先级最高
                  labelColor: Color(0xFF3555FF),
                  //设置选中时的字体样式，tabs里面的字体样式优先级最高
                  labelStyle: TextStyle(fontSize: 12),
                  //允许左右滚动
                  isScrollable: true,
                  //选中下划线的颜色
                  indicatorColor: Color(0xFF3555FF),
                  //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
                  indicatorSize: TabBarIndicatorSize.label,
                  //选中下划线的高度，值越大高度越高，默认为2。0
                  indicatorWeight: 1,
                  //用于设定选中状态下的展示样式
                  /*indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0), // 圆角度
                      // 线性渐变
                      gradient: LinearGradient(
                          colors: [Color(0xFF3555FF), Color(0xFF3B9BF2)],
                          begin: Alignment.centerLeft, end: Alignment.centerRight)),*/
                  tabs: <Widget>[
                    Tab(
                      text: "ETH",
                    ),
                    Tab(
                      text: "HECO",
                    ),
                    Tab(
                      text: "BCS",
                    ),
                    Tab(
                      text: "OEC",
                    ),
                    Tab(
                      text: "POLYGON",
                    ),
                    Tab(
                      text: "TRX",
                    ),
                  ],
                  onTap: (i) {
                    //刷新组件
                    setState(() {
                      _tab_index = i;
                    });
                  },
                ),
              ),
            ),
            //分割线
            Divider(
              //缩进
              // indent: 10.0,
              // endIndent: 20.0,
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            //底部列表
            Expanded(child: myListView1())
          ],
        ),
      ),
    );
  }

  ///构建数据
  List<Widget> _buildChildren() {
    List<Widget> list = [];
    for (int i = 0; i < 20; i++) {
      list.add(
        GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
            children: <Widget>[
              Image.asset("imgs/icp.png", width: 30.0, height: 40.0),
              Text(
                "name",
                style: TextStyle(fontSize: 10, color: Color(0xFF4F4F4F)),
              ),
            ],
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "item $i on click");
          },
        ),
      );
    }
    return list;
  }
}

class myListView1 extends StatelessWidget {
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
