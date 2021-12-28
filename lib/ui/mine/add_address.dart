import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';

///添加地址薄
class AddAddressPage extends StatefulWidget {
  int type = 1;//1、增加、2修改
  AddAddressPage(this.type, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddAddressPage();
}

class _AddAddressPage extends State<AddAddressPage> {

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
          title:Text( widget.type ==1? S().mine16 : S().mine20,
              style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        // body: NoAddress(),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(14),
              //修饰器-圆角
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        //不需要输入框下划线
                        border: InputBorder.none,
                        hintText: S().mine17,
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                        labelText: S().mine17,
                        labelStyle:
                            TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                      ),
                    ),
                  ),
                  //分割线
                  Divider(
                    //缩进
                    indent: 20.0,
                    endIndent: 20.0,
                    //分割线高度
                    height: 1.0,
                    //分割线的厚度
                    thickness: 1.0,
                    color: Color(0xFFF7F7F7),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          decoration: InputDecoration(
                            //不需要输入框下划线
                            border: InputBorder.none,
                            hintText: S().mine18,
                            hintStyle: TextStyle(
                                fontSize: 14, color: Color(0xFFAAAAAA)),
                            labelText: S().mine18,
                            labelStyle: TextStyle(
                                fontSize: 14, color: Color(0xFFAAAAAA)),
                          ),
                        ),
                      ),
                      Image.asset(
                        widget.type ==1? "imgs/ic_scan.png":"imgs/ic_cha.png",
                        width: 20,
                        height: 20,
                      )
                    ]),
                  ),
                  //分割线
                  Divider(
                    //缩进
                    indent: 20.0,
                    endIndent: 20.0,
                    //分割线高度
                    height: 1.0,
                    //分割线的厚度
                    thickness: 1.0,
                    color: Color(0xFFF7F7F7),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      maxLines: 1,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        //不需要输入框下划线
                        border: InputBorder.none,
                        hintText: S().mine19,
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                        labelText: S().mine19,
                        labelStyle:
                            TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // 屏幕宽度
              margin: EdgeInsets.fromLTRB(33,33,33,0),
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
                  S().save,
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
            ),
          ],
        ));
  }
}
