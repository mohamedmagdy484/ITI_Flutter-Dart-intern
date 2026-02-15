import 'package:flutter_winter_dio/network/api_exception.dart';

abstract class ApiResult<T> {}

class Success<T> extends ApiResult<T> {
  final T? data;

  Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ApiException? error;

  Failure(this.error);
}
