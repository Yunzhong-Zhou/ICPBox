import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/api/Api.dart';

class Global {
  static  Global? _instance;
  Dio? dio;

  static Global? getInstance() {
    // if (_instance == null) _instance = Global();
    _instance ??= Global();
    return _instance;
  }

  Global() {
    dio = Dio();
    dio?.options = BaseOptions(
      //根地址
      baseUrl: Api.BASEURL,
      //连接超时
      connectTimeout: 15000,
      //发送超时
      sendTimeout: 15000,
      //回调超时
      receiveTimeout: 15000,
      //头部参数
      headers: {
        // "token": Provider.of<AppDataProvider>(navigatorKey.currentContext,listen: false).Token,
      },
      //请求类型 formUrlEncodedContentType    jsonContentType
      contentType: Headers.formUrlEncodedContentType,
      //返回类型
      responseType: ResponseType.json,
    );
    //拦截监听
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          EasyLoading.show(status: "正在加载...");
          print("请求url：" +
              options.uri.toString() +
              "\n请求数据Header：" +
              options.headers.toString() +
              "\n请求数据Params：" +
              options.queryParameters.toString());
        },
        onResponse: (e, header) {
          EasyLoading.showSuccess("获取成功");
          print("返回：" + e.toString());
        },
        onError: (e, header) {
          print("错误：" + e.toString());
          switch (e.type) {
            case DioErrorType.cancel:
              // 请求取消
              EasyLoading.showError("请求取消");
              break;
            case DioErrorType.connectTimeout:
              // 连接超时
              EasyLoading.showError("连接超时");
              break;
            case DioErrorType.sendTimeout:
              // 请求超时
              EasyLoading.showError("请求超时");
              break;
            case DioErrorType.receiveTimeout:
              // 响应超时
              EasyLoading.showError("响应超时");
              break;
          }
        },
      ),
    );
  }
}
