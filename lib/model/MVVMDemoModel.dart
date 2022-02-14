import 'package:dio/dio.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/request/http_request.dart';
import 'package:icpbox/request/http_utils.dart';

class MVVMDemoModel {
  ///getDemo请求
  ///page 页数
  ///count 条数
  dynamic getDemo(var page,var count) async {
    try{
      print("object");
      throw("测试异常");
    }catch(e){
      print(e);
    }
    return await Dio().get(
      Api.Upgrade,
      queryParameters: {"page": page, "count": count}, //传参
      options: Options(
        headers: {"token": ""}, //header
      ),
    );

  }
}
