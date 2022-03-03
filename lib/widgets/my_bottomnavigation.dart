import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/ui/Information/information.dart';
import 'package:icpbox/ui/dapp/dapp.dart';
import 'package:icpbox/ui/mine/mine.dart';
import 'package:icpbox/ui/wallet/wallet.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';


///底部导航栏
class MyBottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBottomNavigationState();
  }
}

class MyBottomNavigationState extends State<MyBottomNavigation> {
  List<Widget> _pages = [WalletPage(), DappPage(), InformationPage(), MinePage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    /*
    返回一个脚手架，里面包含两个属性，一个是底部导航栏，另一个就是主体内容
     */
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // iconSize: 24.0,
        // selectedFontSize: 10.0,
        // unselectedFontSize: 10.0,
        selectedItemColor: Color(0xFF3555FF),
        unselectedItemColor: Color(0xFF525252),
        // type: BottomNavigationBarType.shifting, 如果为4个会不显示
        type: BottomNavigationBarType.fixed,
        //底部导航栏的创建需要对应的功能标签作为子项，这里我就写了3个，每个子项包含一个图标和一个title。
        items: [
          BottomNavigationBarItem(
            // icon:Icon(Icons.home),
            //长按不会弹出文字
              tooltip: "",
              icon: _currentIndex == 0
                  ? Image.asset("imgs/tab1_on.png", width: 24, height: 24)
                  : Image.asset("imgs/tab1_off.png", width: 24, height: 24),
              label: S.of(context).tab1),
          BottomNavigationBarItem(
            // icon:Icon(Icons.home),
            //长按不会弹出文字
              tooltip: "",
              icon: _currentIndex == 1
                  ? Image.asset("imgs/tab2_on.png", width: 24, height: 24)
                  : Image.asset("imgs/tab2_off.png", width: 24, height: 24),
              label: S.of(context).tab2),
          BottomNavigationBarItem(
            // icon:Icon(Icons.home),
            //长按不会弹出文字
              tooltip: "",
              icon: _currentIndex == 2
                  ? Image.asset("imgs/tab3_on.png", width: 24, height: 24)
                  : Image.asset("imgs/tab3_off.png", width: 24, height: 24),
              label: S.of(context).tab3),
          BottomNavigationBarItem(
            // icon:Icon(Icons.home),
            //长按不会弹出文字
              tooltip: "",
              icon: _currentIndex == 3
                  ? Image.asset("imgs/tab4_on.png", width: 24, height: 24)
                  : Image.asset("imgs/tab4_off.png", width: 24, height: 24),
              label: S.of(context).tab4),
        ],
        //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
        currentIndex: _currentIndex,
        //这是点击属性，会执行带有一个int值的回调函数，这个int值是系统自动返回的你点击的那个标签的位标
        onTap: (int i) {
          //进行状态更新，将系统返回的你点击的标签位标赋予当前位标属性，告诉系统当前要显示的导航标签被用户改变了。
          setState(() {
            _currentIndex = i;
          });
        },
      ),
      //主体显示的页面跟随当前导航标签的位标值在pages页面列表中选择。
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
    );
  }
}