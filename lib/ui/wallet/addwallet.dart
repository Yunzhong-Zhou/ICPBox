import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';

///创建钱包
class AddWalletPage extends StatelessWidget {
  const AddWalletPage({Key? key}) : super(key: key);

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
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S().wallet8,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              Container(
                padding: EdgeInsets.only(left: 8),
                alignment: Alignment.bottomLeft,
                  child: Text(S().wallet9 + "(1/4)",
                      style:
                          TextStyle(fontSize: 10, color: Color(0xFFCCCCCC)))),
            ],
          ),
          elevation: 0,
        ),
        // body: NoAddress(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(17, 40, 17, 38),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x80E0E0E0),
                        offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                        blurRadius: 15.0, //阴影模糊程度
                        spreadRadius: 1.0 //阴影扩散程度
                    )
                  ]),
              child: Column(
                children: [
                  Text(
                    S().wallet10,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // 屏幕宽度
              margin: EdgeInsets.all(17),
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
                onPressed: () {},
                child: Text(
                  S().next,
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
        ));
  }
}
