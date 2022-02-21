import 'package:flutter/material.dart';
import 'package:icpbox/main.dart';

AppBar MyAppBar(String title){
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      color: Colors.black,
      onPressed: () {
        // Navigator.of(navigatorKey.currentContext).pop();
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
  );
}