import 'package:json_annotation/json_annotation.dart';

part 'change_password_http.g.dart';

@JsonSerializable()
class ChangePasswordHttpGet {
  //final Data data;
  final String api_current_token;
  final String message;
  final dynamic code;
  final dynamic status;

  ChangePasswordHttpGet({this.api_current_token, this.message, this.code, this.status});

  factory ChangePasswordHttpGet.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordHttpGetFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordHttpGetToJson(this);
}

