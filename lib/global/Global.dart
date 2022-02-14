import 'package:dio/dio.dart';
import 'package:icpbox/api/Api.dart';

class Global {
  static  Global? _instance;
  late Dio dio;

  static Global? getInstance() {
       if(_instance == null)
          _instance = Global();
    // _instance ??= Global();
    return _instance;
  }

  Global() {
    dio = Dio();
    dio.options = BaseOptions(
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
      //请求类型 jsonContentType
      contentType: Headers.formUrlEncodedContentType,
      //返回类型
      responseType: ResponseType.json,
    );
    //拦截监听
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options,handler){
        print("请求："+options.uri.toString());
      },
      onResponse: (e,header){
        print("返回："+e.toString());
      },
      onError: (e,header){
        print("错误："+e.toString());
      }
    ));

  }
}
