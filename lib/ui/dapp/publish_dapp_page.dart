import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/widgets/dottedline.dart';

///发布
class PublshDappPage extends StatefulWidget {
  List widgets = [MyListView1(),MyListView2(),MyListView3()];
  @override
  State<StatefulWidget> createState() => _PublshDappPage();
}

int index = 1;

class _PublshDappPage extends State<PublshDappPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        //去掉阴影效果
        elevation: 0.0,
        //文字标题居中
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(bottom: 30),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: MyTitle(),
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
          // padding: EdgeInsets.only(left: 20.0, right: 20.0),
          //修饰器-顶部圆角
          decoration: BoxDecoration(
            color: Color(0xFFF3F6FC),
            borderRadius: BorderRadius.vertical(top: Radius.elliptical(30, 30)),
          ),
          /*child: index == 1
              ? MyListView1()
              : index == 2
                  ? MyListView2()
                  : MyListView3(),*/
          /*child: Visibility(
            visible: true,
            child: MyListView1(),
          ),*/
          child: widget.widgets[index-1],
        ),
      ),
    );
  }
}

class MyTitle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTitle();
}

class _MyTitle extends State<MyTitle> {
  @override
  Widget build(BuildContext context) {
    /*return Column(
      children: [
        Row(
          children: [
            Image.asset(
              index == 1 ? "imgs/ic_yuan_on.png" : "imgs/ic_yuan_off.png",
              width: 28,
              height: 28,
            ),
            //虚线
            Expanded(
              child: Container(
                // margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: DottedLine(color: Color(0x4DFFFFFF), width: 1),
              ),
            ),
            Image.asset(
              index == 2 ? "imgs/ic_yuan_on.png" : "imgs/ic_yuan_off.png",
              width: 28,
              height: 28,
            ),
            //虚线
            Expanded(
              child: Container(
                // margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: DottedLine(color: Color(0x4DFFFFFF), width: 1),
              ),
            ),
            Image.asset(
              index == 3 ? "imgs/ic_yuan_on.png" : "imgs/ic_yuan_off.png",
              width: 28,
              height: 28,
            )
          ],
        ),
        Row(
          children: [
            Text(
              S().dapp3,
              style: TextStyle(
                  fontSize: 16,
                  color: index == 1 ? Colors.white : Color(0x4DFFFFFF)),
            ),
            Spacer(),
            Text(
              "DAPP",
              style: TextStyle(
                  fontSize: 16,
                  color: index == 2 ? Colors.white : Color(0x4DFFFFFF)),
            ),
            Spacer(),
            Text(
              S().dapp4,
              style: TextStyle(
                  fontSize: 16,
                  color: index == 3 ? Colors.white : Color(0x4DFFFFFF)),
            )
          ],
        )
      ],
    );*/
    return Container(
      padding: EdgeInsets.only(right: 27),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            child: Column(
              children: [
                Image.asset(
                  index == 1 ? "imgs/ic_yuan_on.png" : "imgs/ic_yuan_off.png",
                  width: 28,
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    S().dapp3,
                    style: TextStyle(
                        fontSize: 16,
                        color: index == 1 ? Colors.white : Color(0x4DFFFFFF)),
                  ),
                )
              ],
            ),
          ),
          //虚线
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 27),
              child: DottedLine(color: Color(0x4DFFFFFF), width: 1),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: Column(
              children: [
                Image.asset(
                  index == 2 ? "imgs/ic_yuan_on.png" : "imgs/ic_yuan_off.png",
                  width: 28,
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    "DAPP",
                    style: TextStyle(
                        fontSize: 16,
                        color: index == 2 ? Colors.white : Color(0x4DFFFFFF)),
                  ),
                )
              ],
            ),
          ),
          //虚线
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 27),
              child: DottedLine(color: Color(0x4DFFFFFF), width: 1),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: Column(
              children: [
                Image.asset(
                  index == 3 ? "imgs/ic_yuan_on.png" : "imgs/ic_yuan_off.png",
                  width: 28,
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                    S().dapp4,
                    style: TextStyle(
                        fontSize: 16,
                        color: index == 3 ? Colors.white : Color(0x4DFFFFFF)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          padding: EdgeInsets.only(top: 22, left: 19),
          child: Text(
            S().dapp5,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp6,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,
              hintText: S().dapp7,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp8,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            keyboardType: TextInputType.emailAddress, //键盘类型
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,
              hintText: S().dapp9,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp10,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            keyboardType: TextInputType.number, //键盘类型
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,

              hintText: S().dapp11,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // 屏幕宽度
          margin: EdgeInsets.fromLTRB(18, 50, 18, 50),
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
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}

class MyListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          padding: EdgeInsets.only(top: 22, left: 19),
          child: Text(
            S().dapp12,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp13,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,
              hintText: S().dapp14,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp15,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            keyboardType: TextInputType.emailAddress, //键盘类型
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,
              hintText: S().dapp16,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp17,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            keyboardType: TextInputType.number, //键盘类型
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,

              hintText: S().dapp18,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // 屏幕宽度
          margin: EdgeInsets.fromLTRB(18, 50, 18, 50),
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
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}

class MyListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          padding: EdgeInsets.only(top: 22, left: 19),
          child: Text(
            S().dapp5,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp6,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,
              hintText: S().dapp7,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp8,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            keyboardType: TextInputType.emailAddress, //键盘类型
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,
              hintText: S().dapp9,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 17, left: 19),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S().dapp10,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2B343C),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF0000),
                      fontWeight: FontWeight.bold),
                ),
              ]),
            )),
        Container(
          padding: EdgeInsets.only(top: 17, left: 21, right: 21),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.black),
            keyboardType: TextInputType.number, //键盘类型
            maxLines: 1,
            decoration: InputDecoration(
              //内容内边距，影响高度
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //重点，相当于高度包裹的意思，必须设置为true，不然有默认的最小高度
              isCollapsed: true,

              hintText: S().dapp11,
              hintStyle: TextStyle(fontSize: 12, color: Color(0xFF9F9F9F)),
              //圆角边框
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB), //边线颜色
                  width: 1, //边线宽度
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // 屏幕宽度
          margin: EdgeInsets.fromLTRB(18, 50, 18, 50),
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
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
