// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordHttpGet _$ForgotPasswordHttpGetFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordHttpGet(
    api_current_token: json['api_current_token'] as String,
    message: json['message'] as String,
    code: json['code'],
    status: json['status'],
  );
}

Map<String, dynamic> _$ForgotPasswordHttpGetToJson(
        ForgotPasswordHttpGet instance) =>
    <String, dynamic>{
      'api_current_token': instance.api_current_token,
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
