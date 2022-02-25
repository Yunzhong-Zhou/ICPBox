import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'informtaion1_page.dart';
import 'informtaion2_page.dart';

///资讯
class InformationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InformationPage();
}

List<Tab> tabs = [
  Tab(
    text: S().infomation1,
  ),
  Tab(
    text: S().infomation2,
  ),
];
List<Widget> tabBarViews = [
  InforMation1Page(),
  InforMation2Page(),
];

class _InformationPage extends State<InformationPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      //默认选中第几项
      initialIndex: 0,
    );
    //切换监听
    _tabController?.addListener(() {
      print("切换到了第${_tabController?.index}项");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //销毁
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //去掉阴影效果
        elevation: 0.0,
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: TabBar(
            tabs: tabs,
            controller: _tabController,
            //可延长
            isScrollable: false,
            //选中下划线的高度，值越大高度越高，默认为2。0
            indicatorWeight: 2,
            //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
      ),
      body: TabBarView(
        children: tabBarViews,
        controller: _tabController,
      ),
    );
  }
}
