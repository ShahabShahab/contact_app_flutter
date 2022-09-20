import 'package:dio/dio.dart';
import 'package:parsianotp/models/response_error_wrapper.dart';

class DomesticResponseWrapper<T> {
  final bool ok;
  final ResponseErrorWrapper error;
  final T data;

  DomesticResponseWrapper({this.ok = true, this.error, this.data});

  factory DomesticResponseWrapper.fromDioError({DioError error}) {
    switch (error.type) {
      case DioErrorType.RESPONSE:
        return DomesticResponseWrapper.fromDioErrorResponse(error);
      case DioErrorType.CONNECT_TIMEOUT:
        return DomesticResponseWrapper.fromDioErrorConnectionTimeout();
      case DioErrorType.DEFAULT:
        return DomesticResponseWrapper.fromError(error, null);
      default:
        return DomesticResponseWrapper.fromDioErrorResponse(error);
    }
  }

  factory DomesticResponseWrapper.fromError(Object error, stack) {
    return DomesticResponseWrapper<T>(
        ok: false,
        error:
            ResponseErrorWrapper(message: "Somethiog Went Wrong!", code: 1000));
  }

  factory DomesticResponseWrapper.fromCustomError(String error) {
    return DomesticResponseWrapper<T>(
        ok: false, error: ResponseErrorWrapper(message: error, code: 1000));
  }

  factory DomesticResponseWrapper.fromJson(
      Map<String, dynamic> json, Function(Map) fromjson) {
    return DomesticResponseWrapper<T>(ok: json["ok"], data: fromjson(json));
  }

  factory DomesticResponseWrapper.builder(bool flag, String error, T data) {
    return DomesticResponseWrapper<T>(ok: flag, data: data);
  }

  factory DomesticResponseWrapper.fromDioErrorResponse(DioError error) {
    DomesticResponseWrapper<T> baseModel;
    try {
      var emptyDescError = ResponseErrorWrapper.fromJson(error.response.data);
      if (emptyDescError.message == null) {
        baseModel = DomesticResponseWrapper<T>(
            ok: false, error: ResponseErrorWrapper(message: "Nothing to say!"));
      } else {
        baseModel = DomesticResponseWrapper<T>(
            ok: false,
            error: ResponseErrorWrapper.fromJson(error.response.data));
      }
    } catch (e) {
      baseModel = DomesticResponseWrapper<T>(
          ok: false,
          error: ResponseErrorWrapper(message: "Something went wrong!"));
    }
    return baseModel;
  }

  factory DomesticResponseWrapper.fromDioErrorConnectionTimeout() {
    return DomesticResponseWrapper(
        ok: false, error: ResponseErrorWrapper(message: "Connection Timeout"));
  }
}
