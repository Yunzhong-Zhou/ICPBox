import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icpbox/generated/l10n.dart';

///搜素
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPage();
}
List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
class _SearchPage extends State<SearchPage> {
  //输入监听
  var _controller;

  @override
  void initState() {
    super.initState();
    //输入监听
    _controller = TextEditingController();
    _controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //取消左边返回按钮
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //去掉阴影效果
        elevation: 0.0,
        centerTitle: true,
        //输入框
        title: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            maxLines: 1,
            style: TextStyle(fontSize: 14, color: Colors.black),
            //隐藏文本-密码
            // obscureText: true,
            //输入类型
            keyboardType: TextInputType.text,
            //键盘右下角按钮
            textInputAction: TextInputAction.search,
            //光标
            cursorColor: Colors.black,
            cursorWidth: 1,
            //关闭软键盘
            focusNode: FocusNode(),
            // cursorRadius: Radius.circular(15),
            //装饰器-有下划线
            decoration: InputDecoration(
              //不需要输入框下划线
              border: InputBorder.none,
              //提示
              hintText: S().sreachinfo,
              hintStyle: TextStyle(fontSize: 14, color: Color(0xFFC1C1C5)),
              //左边图标设置
              icon: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  "imgs/ic_search.png",
                  width: 16,
                  height: 16,
                ),
              ),
              //输入里面输入文字内边距设置
              contentPadding: const EdgeInsets.only(
                  top: 0.0, left: -19.0, right: -19.0, bottom: 8.0),
            ),
            controller: _controller,
            onEditingComplete: () {
              //关闭软键盘
              FocusScope.of(context).requestFocus(FocusNode());
              //输入完成时
              Fluttertoast.showToast(msg: _controller.text);
              //清空输入框
              _controller.text = "";
            },
          ),
        ),
        //右边动作按钮
        actions: [
          Container(
            padding: EdgeInsets.all(18),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S().cancel,
                style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(13),
            child: Text(S().dapp30,
                style: TextStyle(fontSize: 14, color: Color(0xFF4F4F4F))),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20),
            child: Wrap(
              spacing: 15, //主轴上子控件的间距
              runSpacing: 15, //交叉轴上子控件之间的间距
              children: MyCips(), //要显示的子控件集合
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Expanded(
                    child: Text(S().dapp31,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)))),
                Container(
                  padding: EdgeInsets.all(13),
                  child: Image.asset(
                    "imgs/ic_delete2.png",
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
          //底部列表
          Expanded(child: myListView1())
        ],
      ),
    );
  }

  List<Widget> MyCips() => List.generate(list.length, (index) {
        //随机一个英文单词
        var wordPair = WordPair.random();
        return Chip(
          label: Text(
            wordPair.asPascalCase + "${index}",
            style: TextStyle(
              color: Color(0xFF868B92),
              fontSize: 14,
            ),
          ),
          backgroundColor: Color(0xFFF6F8F7),
        );
      });
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
          return ListTile(
            onTap: () {},
            leading: Image.asset("imgs/icp.png", width: 30, height: 30),
            title: Text("title",
                style: TextStyle(color: Color(0xFF687177), fontSize: 12.0)),
            // Expanded(child: Container()),
            subtitle: Text("content",
                style: TextStyle(color: Color(0xFFACAFB4), fontSize: 12.0)),
            //紧凑程度 -4 ~ 4
            visualDensity: VisualDensity(horizontal: -4.0),
          );
          /*return Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(18, 10, 10, 20),
            child: Row(
              //对齐方式
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "imgs/icp.png",
                  width: 44,
                  height: 44,
                ),
                SizedBox(width: 10), // 20宽度
                Text("ICP1",
                    style: TextStyle(fontSize: 14, color: Color(0xFF484848))),
                Spacer(), //使用Spacer填充尽可能大的空间
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("0",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF484848))),
                    Text("\$ 0",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFA7A7A7))),
                  ],
                ),
              ],
            ),
          );*/
        });
  }
}