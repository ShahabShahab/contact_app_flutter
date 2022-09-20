import 'package:json_annotation/json_annotation.dart';

/// code : 401
/// message : "Invalid access, please check your x-endpoint-key is correct"
part 'response_error_wrapper.g.dart';

@JsonSerializable(includeIfNull: false)
class ResponseErrorWrapper {
  ResponseErrorWrapper({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory ResponseErrorWrapper.fromJson(dynamic json) => _$ResponseErrorWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseErrorWrapperToJson(this);

}
