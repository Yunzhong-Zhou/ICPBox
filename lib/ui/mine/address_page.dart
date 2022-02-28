import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/model/address_model.dart';
import 'package:icpbox/ui/dapp/dapp.dart';
import 'package:icpbox/ui/mine/add_address_page.dart';
import 'package:icpbox/widgets/myappbar.dart';
import 'package:icpbox/widgets/myclassical.dart';
import 'package:icpbox/widgets/myfirstrefresh.dart';
import 'package:lifecycle_lite/lifecycle_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

///地址薄
class AddressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddressPage();
}

class _AddressPage extends State<AddressPage> with LifecycleStatefulMixin {
  late EasyRefreshController _easyRefreshController;

  List<AddressModel> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = EasyRefreshController();
    //数据请求
    // _getDataList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _easyRefreshController.dispose();
  }

  @override
  void whenHide() {
    // TODO: implement whenHide
  }

  @override
  void whenShow() {
    // TODO: implement whenShow
    //数据请求
    _getDataList();
  }

  //数据请求
  Future _getDataList() async {
    try {
      _list.clear();
      //获取接口数据
      SharedPreferences prefs = await SharedPreferences.getInstance();

      setState(() {
        //获取所有的list
        if (prefs.getStringList('ICPAddress') != null) {
          List<String> strlist = prefs.getStringList('ICPAddress')!;
          for (int i = 0; i < strlist.length; i++) {
            print("数据$i:" + strlist[i].toString());
            Map<String, dynamic> addressModel =
                convert.jsonDecode(strlist[i].toString());

            AddressModel model = AddressModel.fromJson(addressModel);
            _list.add(model);
          }
        }
        print("列表：" + _list.length.toString());
      });
    } catch (e) {
      /*setState(() {
        err = true;
        errMsg = e.toString();
      });*/
    }
  }

  //下拉刷新
  Future _onRefresh() async {
    await _getDataList();
    //重置刷新状态
    _easyRefreshController.resetLoadState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: MyAppBarActions(context, S().mine2, [
        IconButton(
          onPressed: () {
            //跳转
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAddressPage(
                    type: 1,
                  ),
                ));
          },
          icon: Icon(Icons.add_circle_outline),
          color: Colors.black,
        )
      ]),
      // body: _list.isEmpty?NoAddress():_MyListView(),

      body: EasyRefresh(
        controller: _easyRefreshController,
        firstRefreshWidget: MyFirstRefresh(),
        emptyWidget: _NoAddress(_list.isEmpty),
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

        child: ListView.builder(
            //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
            primary: true,
            //内容适配
            shrinkWrap: true,
            //item 数量
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return _Item(_list[index], index);
            }),
      ),
    );
  }

  Widget _Item(AddressModel model, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      //修饰器-圆角
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.fromLTRB(17, 20, 0, 20),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "imgs/ic_head.png",
                width: 42,
                height: 42,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 14),
                child: Text(model.name!,
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              )),
              InkWell(
                onTap: () {
                  //删除
                  _showAlrt(S().hint, S().hint2, index);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 14, right: 5),
                  child:
                      Image.asset("imgs/ic_delete.png", width: 18, height: 18),
                ),
              ),
              InkWell(
                  onTap: () {
                    //编辑
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAddressPage(
                            type: 2,
                            name: model.name,
                            address: model.address,
                            beizhu: model.beizhu,
                          ),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    child:
                        Image.asset("imgs/ic_edit.png", width: 18, height: 18),
                  ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(top: 18),
                      child: Text(model.address!,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black)))),
              InkWell(
                  onTap: () {
                    //复制文本到粘贴板
                    Clipboard.setData(ClipboardData(text: model.address));
                    EasyLoading.showToast(S().copysuccess);
                    // Fluttertoast.showToast(msg: S().copysuccess);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 18, left: 20, right: 20),
                    child: Image.asset("imgs/ic_fuzhi_black.png",
                        width: 18, height: 18),
                  ))
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                model.beizhu!,
                style: const TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
              ))
        ],
      ),
    );
  }

  void _showAlrt(var _title, var _content, int index) async {
    var result = await showDialog(
        //点击空白区域是否关闭对话框
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          //ios风格的组件Cupertino开头
          return CupertinoAlertDialog(
            title: Text(_title),
            content: Text(_content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(S().cancel)),
              TextButton(
                  onPressed: () {
                    _remove(index);
                  },
                  child: Text(S().confirm))
            ],
          );
        });
    if (result) {
      //刷新
      _easyRefreshController.callRefresh();
    }
  }

  //删除
  void _remove(int index) async {
    List<String> list = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取所有的list
    if (prefs.getStringList('ICPAddress') != null) {
      list = prefs.getStringList('ICPAddress')!;
    }

    //删除当前数据
    list.removeAt(index);
    for (int i = 0; i < list.length; i++) {
      print("数据$i:" + list[i]);
    }
    prefs.setStringList('ICPAddress', list);

    Navigator.pop(context, true);
  }

  ///没有地址
  Widget? _NoAddress(bool empty) {
    return empty
        ? Container(
            width: MediaQuery.of(context).size.width, // 屏幕宽度
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Image.asset(
                  "imgs/bg_noaddress.png",
                  width: 160,
                  height: 160,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(S().mine15,
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFF5E6A71))),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // 屏幕宽度
                  margin: const EdgeInsets.symmetric(horizontal: 33),
                  height: 48,
                  //在此设置
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF3555FF),
                      Color(0xFF3878F9),
                      Color(0xFF3B9BF2),
                    ]),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      //跳转
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAddressPage(
                              type: 1,
                            ),
                          ));
                    },
                    child: Text(
                      S().add,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ButtonStyle(
                      //去除阴影
                      elevation: MaterialStateProperty.all(0),
                      //将按钮背景设置为透明
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                )
              ],
            ),
          )
        : null;
  }
}
