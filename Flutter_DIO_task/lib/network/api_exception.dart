import 'package:dio/dio.dart';

class ApiException {
  final int? code;
  final String? message;

  ApiException({this.code, this.message});
}

ApiException handleError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
      return ApiException(message: 'Timeout, please try again later');
    case DioExceptionType.badResponse:
      return ApiException(
        message: e.response?.statusMessage,
        code: e.response?.statusCode,
      );
    case DioExceptionType.badCertificate:
      return ApiException(message: 'Bad Certificate');

    case DioExceptionType.connectionError:
      return ApiException(message: e.message ?? 'Connection Error');
    default:
      return ApiException(message: 'Something went wrong');
  }
}