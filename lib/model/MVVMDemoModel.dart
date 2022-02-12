import 'package:dio/dio.dart';
import 'package:icpbox/api/Api.dart';

class MVVMDemoModel {
  ///getDemo请求
  ///page 页数
  ///count 条数
  dynamic getDemo(var page,var count) async {
    return await Dio().get(
      Api.Upgrade,
      queryParameters: {"page": page, "count": count}, //传参
      options: Options(
        headers: {"token": ""}, //header
      ),
    );

  }
}
