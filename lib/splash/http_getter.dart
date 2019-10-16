import 'package:json_annotation/json_annotation.dart';

part 'http_getter.g.dart';

@JsonSerializable()
class AuthHttpGet {
  //final Data data;
  final String api_current_token;
  final String message;
  final dynamic code;
  final dynamic status;

  AuthHttpGet({this.api_current_token, this.message, this.code, this.status});

  factory AuthHttpGet.fromJson(Map<String, dynamic> json) =>
      _$AuthHttpGetFromJson(json);
  Map<String, dynamic> toJson() => _$AuthHttpGetToJson(this);
}

