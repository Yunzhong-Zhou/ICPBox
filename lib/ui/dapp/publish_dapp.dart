import 'package:flutter/material.dart';

///发布
class PublshDappPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PublshDappPage();
}

class _PublshDappPage extends State<PublshDappPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('发布'),
      ),
      body: new Center(
        child: Icon(
          Icons.home,
          size: 130.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
