// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginHttpGet _$LoginHttpGetFromJson(Map<String, dynamic> json) {
  return LoginHttpGet(
    api_current_token: json['api_current_token'] as String,
    message: json['message'] as String,
    code: json['code'],
    status: json['status'],
  );
}

Map<String, dynamic> _$LoginHttpGetToJson(LoginHttpGet instance) =>
    <String, dynamic>{
      'api_current_token': instance.api_current_token,
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
