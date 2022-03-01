import 'package:flutter/material.dart';
import 'package:icpbox/main.dart';

///标题栏
AppBar MyAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      color: Colors.black,
      onPressed: () {
        Navigator.of(context).pop();
        // Navigator.of(navigatorKey.currentState!.context).pop();
      },
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
    backgroundColor: Colors.white,
    //去掉阴影效果
    elevation: 0.0,
    //文字标题居中
    centerTitle: true,
  );
}

AppBar MyAppBarActions(BuildContext context, String title,List<Widget> actions) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      color: Colors.black,
      onPressed: () {
        Navigator.of(context).pop();
        // Navigator().onPopPage;
      },
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
    backgroundColor: Colors.white,
    //去掉阴影效果
    elevation: 0.0,
    //文字标题居中
    centerTitle: true,
    actions: actions,
  );
}

