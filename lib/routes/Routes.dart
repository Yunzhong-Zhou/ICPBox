import 'package:flutter/material.dart';
import 'package:icpbox/ui/dapp/search.dart';
import 'package:icpbox/widgets/bottomnavigation.dart';

///路由
Map<String, WidgetBuilder> routes = {
  "/": (BuildContext content) => BottomNavigationWidget(),//主页
  "search": (BuildContext content) => SearchPage(),//搜索


};
