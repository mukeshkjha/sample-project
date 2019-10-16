// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_getter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthHttpGet _$AuthHttpGetFromJson(Map<String, dynamic> json) {
  return AuthHttpGet(
    api_current_token: json['api_current_token'] as String,
    message: json['message'] as String,
    code: json['code'],
    status: json['status'],
  );
}

Map<String, dynamic> _$AuthHttpGetToJson(AuthHttpGet instance) =>
    <String, dynamic>{
      'api_current_token': instance.api_current_token,
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
