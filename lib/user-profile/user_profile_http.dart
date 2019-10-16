import 'package:json_annotation/json_annotation.dart';

part 'user_profile_http.g.dart';

@JsonSerializable()
class UserProfileHttpGet {
  final Data data;
  final String api_current_token;
  final String message;
  final dynamic code;
  final dynamic status;

  UserProfileHttpGet({this.data,this.api_current_token, this.message, this.code, this.status});

  factory UserProfileHttpGet.fromJson(Map<String, dynamic> json) =>
      _$UserProfileHttpGetFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileHttpGetToJson(this);
}

@JsonSerializable()
class Data{
  final String image_path;
  final String first_name;
  final String  last_name;
  final String email;
  final String  phone;
  Data({this.image_path,this.first_name,this.last_name,this.email,this.phone});

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

