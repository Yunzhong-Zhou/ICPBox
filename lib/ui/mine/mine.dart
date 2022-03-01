import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/request/http_utils.dart';
import 'package:icpbox/ui/dapp/publish_dapp_page.dart';
import 'package:icpbox/ui/mine/about_page.dart';
import 'package:icpbox/ui/mine/address_page.dart';
import 'package:icpbox/ui/mine/notice_page.dart';
import 'package:icpbox/ui/wallet/selectlanguage.dart';
import 'package:icpbox/ui/webview_page.dart';
import 'package:icpbox/utils/CurrentLocale.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

///我的
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePage();
}

Map<String, dynamic>? _result;
String _twitter = "",
    _telegram = "",
    _email = "",
    _site = "";

class _MinePage extends State<MinePage> {
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    //生命周期
    if (_twitter.isEmpty) {
      loadData();
    }
  }

  void loadData() async {
    EasyLoading.show(status: S().loading2);
    _result = await HttpUtils.get(
      Api.MINE,
    );
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
            style: const TextStyle(
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
          decoration: const BoxDecoration(
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF15204C),
            Color(0xFF273469),
            Color(0xFF3E4F8F),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Container(
            padding: const EdgeInsets.only(left: 10.0),
            //修饰器-顶部圆角
            decoration: const BoxDecoration(
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
            title: Text(
              S.of(context).mine2,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              //跳转 通知公告
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoticePage(
                      type: 1,
                    ),
                  ));
            },
            leading: Image.asset("imgs/ic_mine2.png", width: 22, height: 22),
            title: Text(
              S.of(context).mine3,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoticePage(
                      type: 2,
                    ),
                  ));
            },
            leading: Image.asset("imgs/ic_mine3.png", width: 22, height: 22),
            title: Text(
              S.of(context).mine4,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        //分割线
        const Divider(
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
            onTap: () {
              //跳转 分享
              Navigator.of(context).pushNamed("Share");
            },
            leading: Image.asset("imgs/ic_mine4.png", width: 22, height: 22),
            title: Text(
              S.of(context).mine5,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: const VisualDensity(horizontal: -4.0),
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
            title: Text(
              S.of(context).mine6,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF616061),
              ),
            ),
            visualDensity: const VisualDensity(horizontal: -4.0),
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
                    style: const TextStyle(
                        color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text(
                    Provider.of<AppDataProvider>(context, listen: false)
                        .LanguageName,
                    style: const TextStyle(
                        color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            visualDensity: const VisualDensity(horizontal: -4.0),
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
                    style: const TextStyle(
                        color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text("${list_huobi[select_huobi]}",
                    style: const TextStyle(
                        color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        const Divider(
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
            onTap: () {
              //跳转 github
              _jumpWebView(_twitter);
            },
            leading: Image.asset("imgs/ic_mine7.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine9,
                    style: const TextStyle(
                        color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text(_twitter,
                    style: const TextStyle(
                        color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              //跳转 电报
              _jumpWebView(_telegram);
            },
            leading: Image.asset("imgs/ic_mine8.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine10,
                    style: const TextStyle(
                        color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text(_telegram,
                    style: const TextStyle(
                        color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              //跳转 官方网站
              _jumpWebView(_email);
            },
            leading: Image.asset("imgs/ic_mine9.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine11,
                    style: const TextStyle(
                        color: Color(0xFF616061), fontSize: 12.0)),
                //填充组件
                // Expanded(child: Container()),
                Text(_email,
                    style: const TextStyle(
                        color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
        ListTile(
            onTap: () {
              //跳转 官方网站
              _jumpWebView(_site);

            },
            leading: Image.asset("imgs/ic_mine10.png", width: 22, height: 22),
            title: Row(
              //两端对齐
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).mine12,
                    style: const TextStyle(
                        color: Color(0xFF616061), fontSize: 12.0)),
                // Expanded(child: Container()),
                Text(_site,
                    style: const TextStyle(
                        color: Color(0xFFC0C0C0), fontSize: 12.0)),
              ],
            ),
            //紧凑程度 -4 ~ 4
            visualDensity: const VisualDensity(horizontal: -4.0),
            trailing:
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)),
      ],
    );
  }
  _jumpWebView(String url){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewPage(initialUrl: url,),
        ));
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
        return type == 1 ? SelectLanguage() : buildBottomSheetWidget_huobi();
      },
      backgroundColor: Colors.transparent, //重要
      context: context);
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
  const buildBottomSheetWidget_huobi({Key? key}) : super(key: key);

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
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
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
                      style: const TextStyle(
                          color: Color(0xFF687177), fontSize: 16.0)),
                  //紧凑程度 -4 ~ 4
                  visualDensity: const VisualDensity(horizontal: -4.0),
                  trailing: Image.asset(
                      select_huobi == index
                          ? "imgs/ic_xuanzhong.png"
                          : "imgs/ic_weixuan.png",
                      width: 24,
                      height: 24),
                );
              },
            ),
            const Divider(
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  S.of(context).cancel,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
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
