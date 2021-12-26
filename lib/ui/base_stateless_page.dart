import 'package:flutter/material.dart';

///默认静态页面  优先使用
class BaseStatelessPage extends StatelessWidget {
  const BaseStatelessPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('默认静态页面'),
      ),
      body: Center(
        child: Text(
          "默认静态页面",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
    );
  }
}
