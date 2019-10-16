import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_http.g.dart';

@JsonSerializable()
class ForgotPasswordHttpGet {
  //final Data data;
  final String api_current_token;
  final String message;
  final dynamic code;
  final dynamic status;

  ForgotPasswordHttpGet({this.api_current_token, this.message, this.code, this.status});

  factory ForgotPasswordHttpGet.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordHttpGetFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordHttpGetToJson(this);
}

