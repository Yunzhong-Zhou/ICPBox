import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/request/http_utils.dart';
import 'package:icpbox/ui/dapp/publish_dapp.dart';
import 'package:icpbox/ui/mine/about.dart';
import 'package:icpbox/ui/mine/address.dart';
import 'package:icpbox/ui/mine/notice.dart';
import 'package:icpbox/utils/CurrentLocale.dart';
import 'package:provider/provider.dart';

///我的
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePage();
}

Map<String, dynamic>? _result;
String _twitter = "",_telegram = "",_email = "",_site = "";

class _MinePage extends State<MinePage> {
  @override
  void initState() {
    //生命周期
    if(_twitter.isEmpty){
      loadData();
    }
  }
  void loadData() async {
    _result = await HttpUtils.get(
      Api.MINE,
    );
    EasyLoading.dismiss();
    print("数据返回Map：" + _result.toString());
    //mounted 属性是否存在
    if (mounted) {
      setState(() {
        _twitter = _result?['data']['twitter'];
        _telegram = _result?['data']['telegram'];
        _email = _result?['data']['email'];
        _site = _result?['data']['site'];
      });
    }

    // String data = json.encode(_result);
    // print("map转json：" + data);
    // print("取值：" + data["data"]);

    /*var data = await HttpUtils.get(
      Api.MINE,
    );
    print("数据返回：" + data.toString());
    print("map转json：" + json.encode(data));*/
    // print("json转map：" + json.decode(data));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        title: Text(S.of(context).mine1,
            style: TextStyle(
              fontSize: 20.0,
              // color: Color.fromARGB(255, 250, 3, 3),
              color: Colors.white,
            )),
        //文字标题居中
        centerTitle: true,
        //去掉阴影效果
        elevation: 0.0,
        //背景渐变
        flexibleSpace: Container(
          //修饰器
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF15204C),
              Color(0xFF273469),
              Color(0xFF3E4F8F),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
        ),
      ),
      body: Container(
        //修饰器-蓝色渐变
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF15204C),
            Color(0xFF273469),
            Color(0xFF3E4F8F),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Container(
            padding: EdgeInsets.only(left: 10.0),
            //修饰器-顶部圆角
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(top: Radius.elliptical(30, 30)),
            ),
            //可滑动控件
            child: MyVerticalList()),
      ),
    );
  }
}

class MyVerticalList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyVerticalList();
}

class _MyVerticalList extends State<MyVerticalList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListTile(
            onTap: () {
              //跳转 地址薄
              /*Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new AddressPage(),
                  ));*/
              Navigator.of(context).pushNamed("Address");
            },
            leading: Image.asset("imgs/ic_mine1.png", width: 22, height: 22),
            title: new Text(
              S.of(context).mine2,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              //跳转 通知公告
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoticePage(),
                  ));*/
              Navigator.of(context).pushNamed("Notice");
            },
            leading: Image.asset("imgs/ic_mine2.png", width: 22, height: 22),
            title: new Text(
              S.of(context).mine3,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {},
            leading: Image.asset("imgs/ic_mine3.png", width: 22, height: 22),
            title: new Text(
              S.of(context).mine4,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        //分割线
        Divider(
          //缩进
          indent: 10.0,
          endIndent: 20.0,
          //分割线高度
          height: 10.0,
          //分割线的厚度
          thickness: 1.0,
          color: Color(0xFFF7F7F7),
        ),
        ListTile(
            onTap: () {},
            leading: Image.asset("imgs/ic_mine4.png", width: 22, height: 22),
            title: new Text(
              S.of(context).mine5,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              //跳转 关于我们
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ));
            },
            leading: Image.asset("imgs/ic_mine5.png", width: 22, height: 22),
            title: new Text(
              S.of(context).mine6,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              setState(() {
                showBottomSheet(context, 1);
              });
            },
            leading: Image.asset("imgs/ic_mine6.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine7,
                    style: TextStyle(color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text("${list_yuyan[select_yuyan]}",
                    style: TextStyle(color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              setState(() {
                showBottomSheet(context, 2);
              });
            },
            leading: Image.asset("imgs/ic_mine11.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine8,
                    style: TextStyle(color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text("${list_huobi[select_huobi]}",
                    style: TextStyle(color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        Divider(
          //缩进
          indent: 10.0,
          endIndent: 20.0,
          //分割线高度
          height: 10.0,
          //分割线的厚度
          thickness: 1.0,
          color: Color(0xFFF7F7F7),
        ),
        ListTile(
            onTap: () {},
            leading: Image.asset("imgs/ic_mine7.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine9,
                    style: TextStyle(color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text("$_twitter",
                    style: TextStyle(color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {},
            leading: Image.asset("imgs/ic_mine8.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine10,
                    style: TextStyle(color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text(_telegram,
                    style: TextStyle(color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {},
            leading: Image.asset("imgs/ic_mine9.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine11,
                    style: TextStyle(color: Color(0xFF616061), fontSize: 12.0)),
                //填充组件
                // Expanded(child: Container()),
                Text(_email,
                    style: TextStyle(color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              // EasyLoading.showToast(S.of(context).mine12);
              /*Fluttertoast.showToast(
                msg: S.of(context).mine12,
                // toastLength: Toast.LENGTH_SHORT,
                // textColor: Colors.white,
                // gravity: ToastGravity.CENTER
              );*/
            },
            leading: Image.asset("imgs/ic_mine10.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine12,
                    style: TextStyle(color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text(_site,
                    style: TextStyle(color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
      ],
    );
  }
}

/**
 * 底部弹出框
 */
void showBottomSheet(BuildContext context, int type) {
  //用于在底部打开弹框的效果
  showModalBottomSheet(
      builder: (BuildContext context) {
        //构建弹框中的内容
        return type == 1
            ? buildBottomSheetWidget_yuyan()
            : buildBottomSheetWidget_huobi();
      },
      backgroundColor: Colors.transparent, //重要
      context: context);
}

///语言底部弹出框的内容
int select_yuyan = 4;
List list_yuyan = ["Россия", "にほんこく", "España", "English", "简体中文"];
List list_yuyanicon = [
  "imgs/elosi.png",
  "imgs/jp.png",
  "imgs/esp.png",
  "imgs/usa.png",
  "imgs/china.png"
];

class buildBottomSheetWidget_yuyan extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _buildBottomSheetWidget_yuyan();
}

class _buildBottomSheetWidget_yuyan
    extends State<buildBottomSheetWidget_yuyan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("语言："+Provider.of<AppDataProvider>(context,listen: false).Language);
    ///语言（1.中文2.英文3.西班牙4.日文5.俄语）
    switch(Provider.of<AppDataProvider>(context,listen: false).Language){
      case "1":
        select_yuyan = 4;
        break;
      case "2":
        select_yuyan = 3;
        break;
      case "3":
        select_yuyan = 2;
        break;
      case "4":
        select_yuyan = 1;
        break;
      case "5":
        select_yuyan = 0;
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 310,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                //取消滑动
                // physics: NeverScrollableScrollPhysics(),
                //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
                primary: true,
                //内容适配
                shrinkWrap: true,
                //item 数量
                itemCount: list_yuyan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        select_yuyan = index;

                        ///语言（1.中文2.英文3.西班牙4.日文5.俄语）
                        switch (select_yuyan) {
                          case 0:
                            //俄语
                            Provider.of<AppDataProvider>(context, listen: false)
                                .setLanguage("5");
                            Provider.of<CurrentLocale>(context, listen: false)
                                .setLocale(const Locale('ru', "RU"));
                            break;
                          case 1:
                            //日文
                            Provider.of<AppDataProvider>(context, listen: false)
                                .setLanguage("4");
                            Provider.of<CurrentLocale>(context, listen: false)
                                .setLocale(const Locale('ja', "JP"));
                            break;
                          case 2:
                            //西班牙
                            Provider.of<AppDataProvider>(context, listen: false)
                                .setLanguage("3");

                            Provider.of<CurrentLocale>(context, listen: false)
                                .setLocale(const Locale('es', "ES"));
                            break;
                          case 3:
                            //英文
                            Provider.of<AppDataProvider>(context, listen: false)
                                .setLanguage("2");
                            Provider.of<CurrentLocale>(context, listen: false)
                                .setLocale(const Locale('en', "US"));
                            break;
                          case 4:
                            //中文
                            Provider.of<AppDataProvider>(context, listen: false)
                                .setLanguage("1");
                            Provider.of<CurrentLocale>(context, listen: false)
                                .setLocale(const Locale('zh', "CH"));
                            break;
                        }
                      });
                      Navigator.of(context).pop(index);
                    },
                    leading: Image.asset(list_yuyanicon[index],
                        width: 30, height: 30),
                    title: Text(list_yuyan[index],
                        style: TextStyle(
                            color: Color(0xFF687177), fontSize: 16.0)),
                    //紧凑程度 -4 ~ 4
                    visualDensity: VisualDensity(horizontal: -4.0),
                    trailing: Image.asset(
                        select_yuyan == index
                            ? "imgs/ic_xuanzhong.png"
                            : "imgs/ic_weixuan.png",
                        width: 24,
                        height: 24),
                  );
                }),
            Divider(
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  S.of(context).cancel,
                  style: TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}

///货币底部弹出框的内容
int select_huobi = 0;
List list_huobi = ["USD", "CNY", "RUB", "EUR", "JPY"];
List list_huobiicon = [
  "imgs/usd.png",
  "imgs/cny.png",
  "imgs/rub.png",
  "imgs/eur.png",
  "imgs/jpy.png"
];

class buildBottomSheetWidget_huobi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _buildBottomSheetWidget_huobi();
}

class _buildBottomSheetWidget_huobi
    extends State<buildBottomSheetWidget_huobi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 310,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              //取消滑动
              // physics: NeverScrollableScrollPhysics(),
              //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
              primary: true,
              //内容适配
              shrinkWrap: true,
              //item 数量
              itemCount: list_huobi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      select_huobi = index;
                      //保存货币
                      Provider.of<AppDataProvider>(context, listen: false)
                          .setHuoBi(list_huobi[select_huobi]);
                    });
                    Navigator.of(context).pop(index);
                  },
                  leading:
                      Image.asset(list_huobiicon[index], width: 30, height: 30),
                  title: Text(list_huobi[index],
                      style:
                          TextStyle(color: Color(0xFF687177), fontSize: 16.0)),
                  //紧凑程度 -4 ~ 4
                  visualDensity: VisualDensity(horizontal: -4.0),
                  trailing: Image.asset(
                      select_huobi == index
                          ? "imgs/ic_xuanzhong.png"
                          : "imgs/ic_weixuan.png",
                      width: 24,
                      height: 24),
                );
              },
            ),
            Divider(
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  S.of(context).cancel,
                  style: TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
