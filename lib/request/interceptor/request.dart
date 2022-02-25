import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:icpbox/main.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:provider/provider.dart';

/// 请求拦截器
class RequestInterceptor extends Interceptor {
  // String accessToken =  Provider.of<AppDataProvider>(navigatorKey.currentState!.context,listen: false).Token;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.copyWith(
      headers: {
        "Content-Type": "application/json",
        // 'Authorization': 'Bearer $accessToken',
      },
    );
    debugPrint("请求url：" +
        options.uri.toString() +
        "\n请求数据Header：" +
        options.headers.toString() +
        "\n请求数据Params：" +
        options.queryParameters.toString());
    return super.onRequest(options, handler);


  }
}
