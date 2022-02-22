import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/global/Global.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/request/http_utils.dart';
import 'package:provider/provider.dart';

///资讯
class InformationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InformationPage();
}

int _page = 1;
int _tab_index = 0;
List list = [1, 2, 3];

class _InformationPage extends State<InformationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(_tab_index == 0){
      _request1();
    }else{
      _request2();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //去掉阴影效果
        elevation: 0.0,
        title: DefaultTabController(
          length: 2, // 定义tab数量
          child: TabBar(
            // controller: _tabController,
            //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
            unselectedLabelColor: Color(0xFF555555),
            //设置未选中时的字体样式，tabs里面的字体样式优先级最高
            unselectedLabelStyle: TextStyle(fontSize: 20),
            //设置选中时的字体颜色，tabs里面的字体样式优先级最高
            labelColor: Color(0xFF3555FF),
            //设置选中时的字体样式，tabs里面的字体样式优先级最高
            labelStyle: TextStyle(fontSize: 20),
            //允许左右滚动
            isScrollable: false,
            //选中下划线的颜色
            indicatorColor: Color(0xFF3555FF),
            //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
            indicatorSize: TabBarIndicatorSize.label,
            //选中下划线的高度，值越大高度越高，默认为2。0
            indicatorWeight: 2,
//                indicator: BoxDecoration(),//用于设定选中状态下的展示样式
            tabs: <Widget>[
              Tab(
                text: S().infomation1,
              ),
              Tab(
                text: S().infomation2,
              ),
            ],
            onTap: (i) {
              //刷新组件
              setState(() {
                _tab_index = i;
                if(_tab_index == 0){
                  _request1();
                }else{
                  _request2();
                }
              });
            },
          ),
        ),
      ),
      body: _tab_index == 0 ? myListView1() : myListView2(),
    );
  }

  ///*******************************数据请求**************************************
  void _request1() async {
    var result1 = await HttpUtils.get(
      Api.INFORMATION1,
      params:{"page": _page,
        "count": Provider.of<AppDataProvider>(context,listen: false).Count,
        "lang":Provider.of<AppDataProvider>(context,listen: false).Language,}, //传参
      options: Options(
        headers: {"token": Provider.of<AppDataProvider>(context,listen: false).Token},//header
      ),
    );
    print("数据返回1：" + result1.toString());
    EasyLoading.dismiss();

  }
  void _request2() async {
    var result2 = await Dio().get(
      Api.INFORMATION2, //url
      queryParameters: {"page": _page,
        "count": Provider.of<AppDataProvider>(context,listen: false).Count,
        "lang":Provider.of<AppDataProvider>(context,listen: false).Language,}, //传参
      options: Options(
        headers: {"token": Provider.of<AppDataProvider>(context,listen: false).Token},//header
      ),
    );
    print("数据返回2：" + result2.toString());

    // var result = await Global.getInstance()?.dio?.get(Api.INFO);
    // print("数据返回：" + result.toString());
    /*var result = await Dio().get(
      Api.INFO, //url
    );
    print("数据返回：" + result.toString());*/
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyTime(),
              MyItem1(),
              //时间文字
              /*if(index == 1) {
                    MyItem()
                  }  else{
                    MyTime(),
                    MyItem(),
                  }*/
              // index != 1 ? MyTime() : MyItem(),
              // index == 1 ? null : MyItem()
            ],
          );
        });
  }
}

class MyTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //文字
    return Container(
        width: MediaQuery.of(context).size.width, // 屏幕宽度,
        color: Color(0xFFF6F6F6),
        padding: EdgeInsets.fromLTRB(9, 5, 9, 5),
        child: Text('2021-10-16',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF888888),
            )));
  }
}

class MyItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // 屏幕宽度
      // height: double.infinity,
      color: Colors.white,
      alignment: Alignment.topLeft,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 200,
            alignment: Alignment.center,
            //层叠布局-竖线及圆形
            child: Stack(
              children: [
                //定位的组件，参考系为 Stack。
                Positioned(
                  width: 34,
                  height: 200,
                  //垂直分割线
                  child: VerticalDivider(
                    //分割线颜色
                    color: Color(0xFFF2F2F2),
                    //分割线区域的高度，并非分割线的高度
                    width: 34,
                    // 分割线的厚度，真正的分割线的高度
                    thickness: 1,
                    //起点缩进距离
                    indent: 0,
                    // 终点缩进距离
                    endIndent: 0,
                  ),
                ),
                Positioned(
                  width: 9,
                  height: 9,
                  left: 13,
                  top: 9,
                  //圆形
                  child: Container(
                      width: 9,
                      height: 9,
                      // alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
                      )),
                )
              ],
            ),
            /*child: VerticalDivider(
              color: Color(0xFFF2F2F2),
              width: 1,
            ),*/
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                // width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                padding: EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Text(
                      "20:28",
                      style: TextStyle(fontSize: 12, color: Color(0xFFBABABA)),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 12),
                        //修饰器-圆角
                        decoration: BoxDecoration(
                          color: Color(0xFFD8D8D8),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text("ETH",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF4A4A4A))))
                  ],
                ),
              ),
              Container(
                // width: double.infinity,
                width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                margin: EdgeInsets.only(top: 6),
                padding: EdgeInsets.only(right: 24),
                child: Text(
                    "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    //超出行数显示省略号
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, color: Color(0xFF4A4A4A))),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(right: 24),
                child: Text("content",
                    maxLines: 5,
                    //超出行数显示省略号
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Color(0xFF818181))),
              ),
              Container(
                // width: MediaQuery.of(context).size.width, // 屏幕宽度
                margin: EdgeInsets.only(top: 15),
                child: Text(S().infomation3,
                    style: TextStyle(fontSize: 14, color: Color(0xFF3555FF))),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                padding: EdgeInsets.only(right: 36),
                // 屏幕宽度
                margin: EdgeInsets.only(top: 19, bottom: 11),
                child: Row(
                  //两端对齐
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S().infomation4,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFDCDCDC))),
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        //设置 child 居中
                        alignment: Alignment(0, 0),
                        height: 20,

                        //边框设置
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF3555FF),
                                Color(0xFF3979F9),
                                Color(0xFF3B9BF2),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          //背景
                          color: Colors.transparent,
                          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //设置四周边框
                          border:
                              Border.all(width: 1, color: Color(0xFF3555FF)),
                        ),
                        child: Text(S().infomation5,
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF3555FF)))),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class myListView2 extends StatelessWidget {
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
          return MyItem2();
        });
  }
}

class MyItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 6, 15, 6),
      color: Colors.white,
      margin: EdgeInsets.only(top: 1, bottom: 9),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //圆角图片
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "imgs/icp.png",
              width: 96,
              height: 80,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 151, // 屏幕宽度
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 7),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle",
                    style: TextStyle(fontSize: 14, color: Color(0xFF4A4A4A)),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis),
                Container(
                  width: MediaQuery.of(context).size.width - 151, // 屏幕宽度
                  padding: EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "name",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFCACACA)),
                      ),
                      Text(
                        "time",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFCACACA)),
                      )
                    ],
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

