import 'package:flutter/material.dart';

import 'myapp_colors.dart';

final ThemeData MyAppTheme = ThemeData(
  // 主题色
  primaryColor: MyAppColor.primary,
  // 脚手架下的页面背景色
  scaffoldBackgroundColor: MyAppColor.page,

  // ElevatedButton 主题
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      // 文字颜色
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.white;
        } else {
          return null;
        }
      }),
      // 背景色
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return MyAppColor.danger.withOpacity(0.5);
        } else {
          return MyAppColor.danger;
        }
      }),
    ),
  ),

  // 小部件的前景色（旋钮，文本，过度滚动边缘效果等）
  accentColor: MyAppColor.primary,
  // 取消水波纹效果
  splashColor: Colors.transparent,
  // 取消水波纹效果
  highlightColor: Colors.transparent,

  hoverColor: Colors.white.withOpacity(0.5),

  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: MyAppColor.black1, // 文字颜色
      fontSize: 14,
    ),
  ),

  // 选项卡栏中所选选项卡指示器的颜色。
  indicatorColor: MyAppColor.primary,
  // tabbar的样式
  tabBarTheme: const TabBarTheme(
    //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
    unselectedLabelColor: MyAppColor.black2,
    //设置未选中时的字体样式，tabs里面的字体样式优先级最高
    unselectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
    //设置选中时的字体颜色，tabs里面的字体样式优先级最高
    labelColor: MyAppColor.primary,
    //设置选中时的字体样式，tabs里面的字体样式优先级最高
    labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
    indicatorSize: TabBarIndicatorSize.label,
    //tab之间的间距
    labelPadding: EdgeInsets.symmetric(horizontal: 14),
  ),

  //顶部标题栏颜色
  appBarTheme: const AppBarTheme(
      backgroundColor: MyAppColor.nav,
      //去掉阴影
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: MyAppColor.unactive, // 文字颜色
      )),

  //底部导航栏颜色
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: MyAppColor.white,
    selectedItemColor: MyAppColor.primary,
    unselectedItemColor: MyAppColor.black2,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
    ),
  ),
);
