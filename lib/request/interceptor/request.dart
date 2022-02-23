import 'package:dio/dio.dart';
import 'package:icpbox/main.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:provider/provider.dart';

/// 错误处理拦截器
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
    return super.onRequest(options, handler);
  }
}
