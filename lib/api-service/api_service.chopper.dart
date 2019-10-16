// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PostApiService;

  Future<Response> getDeviceAuthKey(
      [String apiKey, String deviceId, String deviceToken, String deviceType]) {
    final $url = '/parentapi/authorize/index';
    final $headers = {
      'ApiKey': apiKey,
      'DeviceId': deviceId,
      'DeviceToken': deviceToken,
      'DeviceType': deviceType
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getLoginResponse(
      [String deviceId, String authenticationKey, Map<String, String> param]) {
    final $url = '/user/Api/v1/user/login';
    final $params = param;
    final $headers = {
      'DeviceId': deviceId,
      'AuthorizedToken': authenticationKey
    };
    final $request = Request('POST', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getResistrationResponse(
      [String deviceId,
      String authenticationKey,
      Map<String, String> createUserMap]) {
    final $url = '/user/Api/v1/user/create';
    final $params = createUserMap;
    final $headers = {
      'DeviceId': deviceId,
      'AuthorizedToken': authenticationKey
    };
    final $request = Request('POST', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> forgetPassword(
      [String deviceId,
      String authenticationKey,
      Map<String, String> passwordMap]) {
    final $url = '/user/Api/v1/user/forgotpassword';
    final $params = passwordMap;
    final $headers = {
      'DeviceId': deviceId,
      'AuthorizedToken': authenticationKey
    };
    final $request = Request('POST', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> logout([String deviceId, String authenticationKey]) {
    final $url = '/user/Api/v1/user/logout';
    final $headers = {'DeviceId': deviceId, 'ApiKey': authenticationKey};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> changePassword(
      [String deviceId,
      String authenticationKey,
      Map<String, String> changePassMap]) {
    final $url = '/user/Api/v1/user/changepassword';
    final $params = changePassMap;
    final $headers = {
      'DeviceId': deviceId,
      'AuthorizedToken': authenticationKey
    };
    final $request = Request('POST', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getUserProfile(
      [String deviceId, String authenticationKey, String userid]) {
    final $url = '/user/Api/v1/user/view';
    final Map<String, dynamic> $params = {'user_id': userid};
    final $headers = {
      'DeviceId': deviceId,
      'AuthorizedToken': authenticationKey
    };
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
