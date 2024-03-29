import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icpbox/model/MVVMDemoModel.dart';
import 'package:icpbox/ui/mine/notice_page.dart';

import '../main.dart';

///需在main方法注册
class MVVMDemoViewModel extends ChangeNotifier {
  final MVVMDemoModel _model = MVVMDemoModel();

  void getDemo(var page, var count) async {
    var result = await _model.getDemo(page, count);
    print(result);
    //上下文对象 navigatorKey.currentContext

    /*Navigator.push(
        navigatorKey.currentContext,
        MaterialPageRoute(
          builder: (context) => NoticePage(),
        ));*/
  }
}
