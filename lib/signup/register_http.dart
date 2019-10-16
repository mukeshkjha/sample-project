import 'package:json_annotation/json_annotation.dart';

part 'register_http.g.dart';

@JsonSerializable()
class RegisterHttpGet {
  //final Data data;
  final String api_current_token;
  final String message;
  final dynamic code;
  final dynamic status;

  RegisterHttpGet({this.api_current_token, this.message, this.code, this.status});

  factory RegisterHttpGet.fromJson(Map<String, dynamic> json) =>
      _$RegisterHttpGetFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterHttpGetToJson(this);
}

