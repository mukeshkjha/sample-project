import 'package:json_annotation/json_annotation.dart';
part 'login_http.g.dart';
@JsonSerializable()
class LoginHttpGet{
    final String api_current_token;
  final String message;
  final dynamic code;
  final dynamic status;

  LoginHttpGet({this.api_current_token, this.message, this.code, this.status});

  factory LoginHttpGet.fromJson(Map<String, dynamic> json) =>
      _$LoginHttpGetFromJson(json);
  Map<String, dynamic> toJson() => _$LoginHttpGetToJson(this);
}