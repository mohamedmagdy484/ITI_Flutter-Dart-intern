import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_winter_dio/network/api_constants.dart';

class DioConfig {
  DioConfig._();

  static final Duration _timeout = Duration(seconds: 30);

  static Dio getDio() {
    Dio dio = Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = _timeout
      ..options.receiveTimeout = _timeout
      ..options.contentType = Headers.jsonContentType.toString()
      ..options.responseType = ResponseType.json
      //..interceptors.add(LogInterceptor(responseBody: true));
      ..interceptors.addAll([AuthInterceptor(), LogInterceptor()])
      ..httpClientAdapter = IOHttpClientAdapter();
    // ..options.headers={'Content-Type': 'application/json'}
    return dio;
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers.containsKey('Authorization')) {
      // get token from secure storage
      String token = '';
      options.headers = {'Authorization': 'Bearer $token'};
    }
    handler.next(options);
  }
}
/*
SSL Certificate
CacheRequest
retry
multiple request
 */