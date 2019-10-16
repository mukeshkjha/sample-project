import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class PostApiService extends ChopperService{
  
  @Get(path: '/parentapi/authorize/index')
  Future<Response> getDeviceAuthKey([
    @Header('ApiKey') String apiKey,
    @Header('DeviceId') String deviceId,
    @Header('DeviceToken') String deviceToken,
    @Header('DeviceType') String deviceType,
  ]);
  @Post(path: '/user/Api/v1/user/login')
  Future<Response> getLoginResponse([
    @Header("DeviceId") String deviceId,
    @Header("AuthorizedToken") String authenticationKey,
    @QueryMap() Map<String, String> param,
  ]);
  
  @Post(path: '/user/Api/v1/user/create')
  Future<Response> getResistrationResponse([
    @Header("DeviceId") String deviceId,
    @Header("AuthorizedToken") String authenticationKey,
    @QueryMap() Map<String, String> createUserMap,
  ]);

  @Post(path: '/user/Api/v1/user/forgotpassword')
  Future<Response> forgetPassword([
    @Header("DeviceId") String deviceId,
    @Header("AuthorizedToken") String authenticationKey,
    @QueryMap() Map<String, String> passwordMap,
  ]);

  @Get(path: "/user/Api/v1/user/logout")
  Future<Response> logout([
    @Header("DeviceId") String deviceId,
    @Header("ApiKey") String authenticationKey
  ]);

  @Post(path: "/user/Api/v1/user/changepassword")
  Future<Response> changePassword([
    @Header("DeviceId") String deviceId,
    @Header("AuthorizedToken") String authenticationKey,
    @QueryMap() Map<String, String> changePassMap
  ]);

  @Get(path: "/user/Api/v1/user/view")
  Future<Response> getUserProfile([
    @Header("DeviceId") String deviceId,
    @Header("AuthorizedToken") String authenticationKey,
    @Query("user_id") String userid
  ]);
  

  static PostApiService create() {
    final client=ChopperClient(
      baseUrl: 'http://10.10.1.20/amerijudge/AmeriJudge/backend/web/index.php',
      services:[ _$PostApiService()],
      converter: JsonConverter(),
    );
    return _$PostApiService(client);
  }

}