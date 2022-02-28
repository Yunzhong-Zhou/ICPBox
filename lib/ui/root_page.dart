import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import 'Information/information.dart';
import 'dapp/dapp.dart';
import 'mine/mine.dart';
import 'wallet/wallet.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final Map _bottomNames = {
    "tab1": S().tab1,
    "tab2": S().tab2,
    "tab3": S().tab3,
    "tab4": S().tab4,
  };

  //当前选中页面索引
  int _currentIndex = 0;

  //页面数组
  final List<Widget> _pages = [
    WalletPage(), DappPage(), InformationPage(), MinePage()
  ];

  //底部导航数组
  final List<BottomNavigationBarItem> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //循环生成底部导航
    _bottomNames.forEach((key, value) {
      _items.add(_bottomNavigationBarItem(key, value));
    });
  }

  //底部切换
  void _onTabClick(int index) {
    //点击第二个选项卡
    /*if (index == 2) {
      _onTab3Cilck();
      return;
    }*/
    setState(() {
      _currentIndex = index;
    });
  }

  //中间加号点击事件
  void _onTab3Cilck() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pages[_currentIndex],
      //切换tab不会重新加载页面，有预加载
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      //切换tab不会重新加载页面，没有预加载
      /*body: ProsteIndexedStack(
        index: _currentIndex,
        children: [
          IndexedStackChild(child: WalletPage()),
          IndexedStackChild(child: DappPage()),
          IndexedStackChild(child: InformationPage()),
          IndexedStackChild(child: MinePage()),
        ],
      ),*/

      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        /*selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedItemColor: Color(0xFF000000),
        unselectedItemColor: Colors.black.withOpacity(0.5),*/
        // type: BottomNavigationBarType.shifting, 如果为4个会不显示
        type: BottomNavigationBarType.fixed,
      ),
      //悬浮按钮
      // floatingActionButton: _floatingActionButton(),
      //悬浮按钮位置
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  //底部导航每一个组件
  BottomNavigationBarItem _bottomNavigationBarItem(
      String imgName, String title) {
    return BottomNavigationBarItem(
      //长按不会弹出文字
      tooltip: "",
      label: title,
      icon: Image.asset(
        "imgs/${imgName}_off.png",
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        "imgs/${imgName}_on.png",
        width: 24,
        height: 24,
      ),
    );
  }

  //底部中间按钮
  Widget _floatingActionButton() {
    return Container(
      margin: const EdgeInsets.only(top: 56),
      width: 48,
      height: 48,
      child: FloatingActionButton(
        child: Image.asset(
          "imgs/tab3.png",
        ),
        onPressed: _onTab3Cilck,
      ),
    );
  }
}
