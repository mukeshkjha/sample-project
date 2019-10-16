// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordHttpGet _$ChangePasswordHttpGetFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordHttpGet(
    api_current_token: json['api_current_token'] as String,
    message: json['message'] as String,
    code: json['code'],
    status: json['status'],
  );
}

Map<String, dynamic> _$ChangePasswordHttpGetToJson(
        ChangePasswordHttpGet instance) =>
    <String, dynamic>{
      'api_current_token': instance.api_current_token,
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
