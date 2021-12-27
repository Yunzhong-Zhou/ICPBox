import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';

///通知
class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoticePage();
}

List list = [1, 2, 3];

class _NoticePage extends State<NoticePage> {
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
        body: myListView1());
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
                title: Text("title",
                    style: TextStyle(color: Color(0xFF414141), fontSize: 14.0)),
                // Expanded(child: Container()),
                subtitle: Text("content",
                    style: TextStyle(color: Color(0xFFD2D2D2), fontSize: 12.0)),
                //紧凑程度 -4 ~ 4
                visualDensity: VisualDensity(horizontal: -4.0),
                trailing:
                    Image.asset("imgs/ic_next_gray.png", width: 12, height: 12),
              )
            ],
          );
        });
  }
}
