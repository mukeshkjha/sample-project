// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterHttpGet _$RegisterHttpGetFromJson(Map<String, dynamic> json) {
  return RegisterHttpGet(
    api_current_token: json['api_current_token'] as String,
    message: json['message'] as String,
    code: json['code'],
    status: json['status'],
  );
}

Map<String, dynamic> _$RegisterHttpGetToJson(RegisterHttpGet instance) =>
    <String, dynamic>{
      'api_current_token': instance.api_current_token,
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
