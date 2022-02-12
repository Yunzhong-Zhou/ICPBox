import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(S().mine3,
            style: TextStyle(fontSize: 20, color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
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
    await Future.delayed(
      //延时3秒
      const Duration(seconds: 3),
          () {
        print("延时结束");
      },
    );
  }
}
