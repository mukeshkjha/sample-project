import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTest {

  static final String authenticationKey = "current_token";
  static final String userLoginStatus = "login_status";
  static final String userPunchInStatus = "true";
  static final String userId = "user_id";
  static final String deviceId = "ravi";
  static final String netstatus = "netstatus";
  static final String userName = "ravi";
  static final String userEmail = "user@email.com";
  static final String userPhone = "1234568790";
  static final String imagePath = "netstatus";
  static final String halfDay = "1850002";
  static final String fullDay = "1850001";
  static final String flagAtt = "attendance_flag";
  static final String punchInTime = "punchInTime";
  static final String attendanceLocationOffice = "2000001";
  static final String attendanceLocationField = "2000002";


  static Future<bool> setAuthenticationKey(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(authenticationKey, value);
  }

  static Future<String> getAuthenticationKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(authenticationKey);
    return stringValue;
  }
  static Future<bool> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userName, value);
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(userName);
    return stringValue;
  }
  static Future<bool> setUserEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmail, value);
  }

  static Future<String> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(userEmail);
    return stringValue;
  }
  static Future<bool> setuserPhone(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userPhone, value);
  }

  static Future<String> getuserPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(userPhone);
    return stringValue;
  }
}