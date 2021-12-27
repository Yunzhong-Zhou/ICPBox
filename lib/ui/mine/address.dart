import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';

import '../base_stateful_page.dart';

///地址薄
class AddressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddressPage();
}

List list = [1, 2, 3];

class _AddressPage extends State<AddressPage> {
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
          title: Text(S().mine2,
              style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                //跳转
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BaseStatefulPage(),
                    ));
              },
              icon: Icon(Icons.add_circle_outline),
              color: Colors.black,
            )
          ],
        ),
        body: NoAddress(),

    );
  }
}
class NoAddress extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // 屏幕宽度
      padding: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Image.asset(
            "imgs/bg_noaddress.png",
            width: 160,
            height: 160,
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(S().mine15,
                style: TextStyle(fontSize: 14, color: Color(0xFF5E6A71))),
          ),
          Container(
            width: MediaQuery.of(context).size.width, // 屏幕宽度
            margin: EdgeInsets.only(left: 33,right: 33),
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
              onPressed: (){

              },
              child:Text(
                S().add,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ButtonStyle(
                //去除阴影
                elevation: MaterialStateProperty.all(0),
                //将按钮背景设置为透明
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          )


        ],
      ),
    )

      ;
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
