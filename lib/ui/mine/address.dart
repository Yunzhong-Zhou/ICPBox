import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/ui/mine/add_address.dart';

import '../base_stateful_page.dart';

///地址薄
class AddressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddressPage();
}

List list = [1111, 22222, 33333];

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
                    builder: (context) => AddAddressPage(1),
                  ));
            },
            icon: Icon(Icons.add_circle_outline),
            color: Colors.black,
          )
        ],
      ),
      // body: NoAddress(),
      body: MyListView(),
    );
  }
}

class NoAddress extends StatelessWidget {
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
            width: MediaQuery.of(context).size.width,
            // 屏幕宽度
            margin: EdgeInsets.only(left: 33, right: 33),
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
                      builder: (context) => AddAddressPage(1),
                    ));
              },
              child: Text(
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
    );
  }
}
class MyListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyListView();
}

class _MyListView extends State<MyListView> {
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
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(14, 10, 14, 10),
            //修饰器-圆角
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: EdgeInsets.fromLTRB(17, 20, 0, 20),
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
                      child: Text("Name${list[index]}",
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                    )),
                    InkWell(
                      onTap: () {
                        //删除
                        /*setState(() {
                          list.remove(index);
                        });*/
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 14, right: 5),
                        child: Image.asset("imgs/ic_delete.png",
                            width: 18, height: 18),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          //编辑
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddAddressPage(2),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 20),
                          child: Image.asset("imgs/ic_edit.png",
                              width: 18, height: 18),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(top: 18),
                            child: Text("Content",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)))),
                    InkWell(
                        onTap: () {
                          //复制文本到粘贴板
                          Clipboard.setData(ClipboardData(text: '内容'));
                          Fluttertoast.showToast(msg: S().copysuccess);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 18, left: 20, right: 20),
                          child: Image.asset("imgs/ic_fuzhi_black.png",
                              width: 18, height: 18),
                        ))
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "000",
                      style: TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                    ))
              ],
            ),
          );
        });
  }
}
