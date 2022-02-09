import 'package:flutter/material.dart';

///默认动态页面
///快捷创建 stful
class BaseStatefulPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BaseStatefulPage();
}

class _BaseStatefulPage extends State<BaseStatefulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('默认动态页面'),
      ),
      body: Center(
       child: Text(
         "默认动态页面",
         style: TextStyle(
           fontSize: 30,
           color: Colors.blue
         ),
       ),
      ),
    );
  }
}




