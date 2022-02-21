import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/widgets/myappbar.dart';
import 'package:provider/provider.dart';

///通知
class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoticePage();
}

List list = [];
// ScrollController? controller = ScrollController();

class _NoticePage extends State<NoticePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller?.addListener(() {});
    for (var i = 0; i < 100; i++) {
      list.add(i);
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: MyAppBar(context, S.of(context).mine3),
      body: myListView(),
    );
  }
}

class myListView extends StatefulWidget {
  const myListView({Key? key}) : super(key: key);

  @override
  _myListViewState createState() => _myListViewState();
}

class _myListViewState extends State<myListView> {
  int _page = 1;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
        //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
          primary: true,
          //内容适配
          shrinkWrap: true,
          // controller: controller,
          //item 数量
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
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
                ListTile(
                  tileColor: Colors.white,
                  onTap: () {},
                  title: Text("title" + list[index].toString(),
                      style:
                      TextStyle(color: Color(0xFF414141), fontSize: 14.0)),
                  // Expanded(child: Container()),
                  subtitle: Text("content",
                      style:
                      TextStyle(color: Color(0xFFD2D2D2), fontSize: 12.0)),
                  //紧凑程度 -4 ~ 4
                  visualDensity: VisualDensity(horizontal: -4.0),
                  trailing: Image.asset("imgs/ic_next_gray.png",
                      width: 12, height: 12),
                )
              ],
            );
          }),
      onRefresh: _onRefresh,
    );
  }

  Future _onRefresh() async {
    /*await Future.delayed(
      //延时3秒
      const Duration(seconds: 3),
          () {
        print("延时结束");
      },
    );*/
    var result = await Dio().get(
      Api.NOTICE, //url
      queryParameters: {"page": _page,
        "count": Provider.of<AppDataProvider>(context,listen: false).Count,
      "lang":Provider.of<AppDataProvider>(context,listen: false).Language,}, //传参
      options: Options(
        headers: {"token": Provider.of<AppDataProvider>(context,listen: false).Token},//header
      ),
    );
    print("数据返回：" + result.toString());
  }
}
