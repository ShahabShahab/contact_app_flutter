import 'package:dio/dio.dart';
import 'package:parsianotp/models/response_error_wrapper.dart';

class ResponseWrapper<T> {
  final bool ok;
  final ResponseErrorWrapper error;
  final T data;

  ResponseWrapper({this.ok = true, this.error, this.data});

  factory ResponseWrapper.fromDioError({DioError error}) {
    switch (error.type) {
      case DioErrorType.RESPONSE:
        return ResponseWrapper.fromDioErrorResponse(error);
      case DioErrorType.CONNECT_TIMEOUT:
        return ResponseWrapper.fromDioErrorConnectionTimeout();
      case DioErrorType.DEFAULT:
        return ResponseWrapper.fromError(error, null);
      default:
        return ResponseWrapper.fromDioErrorResponse(error);
    }
  }

  factory ResponseWrapper.fromError(Object error, stack) {
    return ResponseWrapper<T>(
        ok: false,
        error:
            ResponseErrorWrapper(message: "Somethiog Went Wrong!", code: 1000));
  }

  factory ResponseWrapper.fromCustomError(String error) {
    return ResponseWrapper<T>(
        ok: false, error: ResponseErrorWrapper(message: error, code: 1000));
  }

  factory ResponseWrapper.fromJson(
      Map<String, dynamic> json, Function(Map) fromjson) {
    return ResponseWrapper<T>(ok: json["ok"], data: fromjson(json));
  }

  factory ResponseWrapper.builder(bool flag, String error, T data) {
    return ResponseWrapper<T>(ok: flag, data: data);
  }

  factory ResponseWrapper.fromDioErrorResponse(DioError error) {
    ResponseWrapper<T> baseModel;
    try {
      var emptyDescError = ResponseErrorWrapper.fromJson(error.response.data);
      if (emptyDescError.message == null) {
        baseModel = ResponseWrapper<T>(
            ok: false, error: ResponseErrorWrapper(message: "Nothing to say!"));
      } else {
        baseModel = ResponseWrapper<T>(
            ok: false,
            error: ResponseErrorWrapper.fromJson(error.response.data));
      }
    } catch (e) {
      baseModel = ResponseWrapper<T>(
          ok: false,
          error: ResponseErrorWrapper(message: "Something went wrong!"));
    }
    return baseModel;
  }

  factory ResponseWrapper.fromDioErrorConnectionTimeout() {
    return ResponseWrapper(
        ok: false, error: ResponseErrorWrapper(message: "Connection Timeout"));
  }
}
