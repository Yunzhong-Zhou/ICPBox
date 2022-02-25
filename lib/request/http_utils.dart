import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/generated/l10n.dart';

import 'http_request.dart';
import 'interceptor/cache.dart';

class HttpUtils {
  static void init({
    required String baseUrl,
    int connectTimeout = 15000,
    int receiveTimeout = 15000,
    List<Interceptor>? interceptors,
  }) {
    HttpRequest().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      interceptors: interceptors,
    );
  }

  static void cancelRequests({required CancelToken token}) {
    HttpRequest().cancelRequests(token: token);
  }

  static Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    EasyLoading.show(status: S().loading2);
    return await HttpRequest().get(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
      refresh: refresh,
      noCache: noCache,
      cacheKey: cacheKey,
    );
  }

  static Future post(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    EasyLoading.show(status: S().loading3);
    return await HttpRequest().post(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future postForm(
      String path, {
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    EasyLoading.show(status: S().loading3);
    return await HttpRequest().post(
      path,
      data: FormData.fromMap(params!),
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }


  static Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    EasyLoading.show(status: S().loading1);
    return await HttpRequest().put(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    EasyLoading.show(status: S().loading1);
    return await HttpRequest().patch(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    EasyLoading.show(status: S().loading1);
    return await HttpRequest().delete(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
