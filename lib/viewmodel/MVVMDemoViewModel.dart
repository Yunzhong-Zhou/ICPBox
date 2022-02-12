import 'package:flutter/cupertino.dart';
import 'package:icpbox/model/MVVMDemoModel.dart';

///需在main方法注册
class MVVMDemoViewModel extends ChangeNotifier {
  final MVVMDemoModel _model = MVVMDemoModel();

  void getDemo(var page, var count) async {
    var result = await _model.getDemo(page, count);
    print(result);
  }
}
