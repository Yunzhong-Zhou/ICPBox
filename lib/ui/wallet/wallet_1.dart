import 'package:flutter/material.dart';
import 'package:icpbox/ui/dapp/publish_dapp.dart';

///钱包
class WalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WalletPage();
}

int _tab_index = 0;
List list = [1, 2, 3];

class _WalletPage extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //主题色
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          //去掉阴影效果
          elevation: 0.0,
          title: picAndTextButton("imgs/bg_wallet1.png", "ICP-1"),
          //右边动作按钮
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("imgs/ic_more_white.png",
                  width: 22.0, height: 22.0),
            ),
          ],
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
        body: Scaffold(
          //FAB按钮位置
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          //按钮
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            //前景色
            // foregroundColor: Colors.transparent,
            //未点击的时候的阴影
            elevation: 0.0,
            //点击时阴影值，默认 12.0
            highlightElevation: 0.0,
            //点击事件回调
            onPressed: () {
              //跳转
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new PublshDappPage(),
                  ));
            },
            child: Image(
                height: 50.0,
                width: 50.0,
                image: AssetImage("imgs/ic_xinzeng.png")),
          ),
          //可滑动布局
          body: Container(
            //修饰器-蓝色渐变
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF15204C),
                Color(0xFF273469),
                Color(0xFF3E4F8F),
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    //展开的高度
                    expandedHeight: 172,
                    //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
                    floating: false,
                    //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
                    pinned: false,
                    // appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
                    primary: true,
                    //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
                    snap: false,
                    toolbarHeight: 0,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        //修饰器-蓝色渐变
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF15204C),
                                Color(0xFF273469),
                                Color(0xFF3E4F8F),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        child: MyVerticalList(),
                      ),
                      centerTitle: true,
                      title: null,
                    ),
                  )
                ];
              },
              body: MyTabs(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget picAndTextButton(String imgpath, String text) {
  /*return Chip(label: Text(text, style: TextStyle(color: Colors.white, fontSize: 14)),
    backgroundColor:Color(0xFF1F4687) ,
    onDeleted: (){},
    deleteIcon: Image.asset(imgpath),
  );*/
  return Container(
    width: 84,
    height: 26,
    padding: EdgeInsets.only(left: 11.0),
    decoration: BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.fill),
    ),
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14)),
  );
}

class MyVerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListTile(
            onTap: () {},
            title: new Text(
              "钱包地址",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFC7C7C7),
              ),
            ),
            subtitle: Text(
              "TEdsdsdsf234343dfddvcvd34fd4f345rf43ff4",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            visualDensity: VisualDensity(horizontal: -4.0, vertical: -4),
            trailing:
                Image.asset("imgs/ic_fuzhi_white.png", width: 11, height: 11)),
        ListTile(
            onTap: () {},
            title: new Text(
              "Principal ID",
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFFC7C7C7),
              ),
            ),
            subtitle: Text(
              "TEdsdsdsf234343dfddvcvd34fd4f345rf43ff4",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            visualDensity: VisualDensity(horizontal: -4.0, vertical: -4),
            trailing:
                Image.asset("imgs/ic_fuzhi_white.png", width: 11, height: 11)),
        Row(
          //对齐方式
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 20), // 20宽度
            Text("1.018 ICP",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            Spacer(), //使用Spacer填充尽可能大的空间
            Text("\$55.54",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFE1E1E1),
                )),
            SizedBox(width: 20), // 20宽度
          ],
        ),
        Row(
          //对齐方式
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 20), // 20宽度
            Text("≈\$ 0.1.1",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFE1E1E1),
                    fontWeight: FontWeight.w600)),
            Spacer(), //使用Spacer填充尽可能大的空间
            Text("+22.7%",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF21FF65),
                )),
            SizedBox(width: 20), // 20宽度
          ],
        ),
      ],
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTabs();
}

class _MyTabs extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //修饰器-蓝色渐变
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.vertical(top: Radius.elliptical(30, 30)),
        gradient: LinearGradient(colors: [
          Color(0xFF3555FF),
          Color(0xFF3979F9),
          Color(0xFF3B9BF2),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          //横向tabs（蓝色部分）
          Container(
            height: 67,
            width: MediaQuery.of(context).size.width, // 屏幕宽度

            child: ButtonBar(
              // buttonPadding: EdgeInsets.only(top: 20.0,bottom: 11),
              //对齐方式
              alignment: MainAxisAlignment.spaceEvenly,
              //child大小
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: <Widget>[
                    Image.asset("imgs/ic_zhuanzhang.png",
                        width: 18.0, height: 18.0),
                    Text(
                      "转账",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                //垂直分割线
                SizedBox(
                  width: 1,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: <Widget>[
                    Image.asset("imgs/ic_shoukuan.png",
                        width: 18.0, height: 18.0),
                    Text(
                      "收款",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                //垂直分割线
                SizedBox(
                  width: 1,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: <Widget>[
                    Image.asset("imgs/ic_santui.png",
                        width: 18.0, height: 18.0),
                    Text(
                      "闪兑",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //横向tabs（灰色部分）
          Container(
            // padding: EdgeInsets.only(left: 20.0, right: 20.0),
            //修饰器-顶部圆角
            decoration: BoxDecoration(
              color: Color(0xFFF3F6FC),
              borderRadius:
                  BorderRadius.vertical(top: Radius.elliptical(30, 30)),
            ),
            child: DefaultTabController(
              length: 3, // 定义tab数量
              child: TabBar(
                // controller: _tabController,
                //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
                unselectedLabelColor: Color(0xFFC2C2C2),
                //设置未选中时的字体样式，tabs里面的字体样式优先级最高
                unselectedLabelStyle: TextStyle(fontSize: 16),
                //设置选中时的字体颜色，tabs里面的字体样式优先级最高
                labelColor: Color(0xFF4D4D4D),
                //设置选中时的字体样式，tabs里面的字体样式优先级最高
                labelStyle: TextStyle(fontSize: 16),
                //允许左右滚动
                isScrollable: false,
                //选中下划线的颜色
                indicatorColor: Color(0xFF4D4D4D),
                //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
                indicatorSize: TabBarIndicatorSize.label,
                //选中下划线的高度，值越大高度越高，默认为2。0
                indicatorWeight: 1,
//                indicator: BoxDecoration(),//用于设定选中状态下的展示样式
                tabs: <Widget>[
                  Tab(
                    text: "资产",
                  ),
                  Tab(
                    text: "NFTS",
                  ),
                  Tab(
                    text: "DAPPS",
                  ),
                ],
                onTap: (i) {
                  //刷新组件
                  setState(() {
                    _tab_index = i;
                  });
                },
              ),
            ),
          ),
          _tab_index == 0
              ? myListView1()
              : _tab_index == 1
                  ? myListView2()
                  : myListView3(),
        ],
      ),
    );
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
          return Container(
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
          );
        });
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
          return Container(
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
                Text("ICP2",
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
          );
        });
  }
}

class myListView3 extends StatelessWidget {
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
                Text("ICP3",
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
          );
        });
  }
}
