// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileHttpGet _$UserProfileHttpGetFromJson(Map<String, dynamic> json) {
  return UserProfileHttpGet(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    api_current_token: json['api_current_token'] as String,
    message: json['message'] as String,
    code: json['code'],
    status: json['status'],
  );
}

Map<String, dynamic> _$UserProfileHttpGetToJson(UserProfileHttpGet instance) =>
    <String, dynamic>{
      'data': instance.data,
      'api_current_token': instance.api_current_token,
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    image_path: json['image_path'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'image_path': instance.image_path,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
    };
