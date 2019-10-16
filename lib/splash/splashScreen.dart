import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/api-service/api_service.dart';
import 'package:sample_project/helper-methods/helper_methods.dart';
import 'package:sample_project/login%20&%20home/login_screen.dart';
import 'package:sample_project/shared_preferences/shared_preferences.dart';
import 'package:sample_project/splash/http_getter.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
     
   Map<String ,String> sharedMap=new HashMap<String ,String>();
   HelperMethods hm=new HelperMethods();
  
  @override
  void initState()  {
     super.initState();
   hm.firebaseNotification();
    Future.delayed(Duration(milliseconds: 10),(){
           this.getAuthKey();
    });
    
  }
 
  //Auth api call
  Future getAuthKey() async {
      bool res= await  HelperMethods.checkInternetConnection();
      if(res){
       final response = await Provider.of<PostApiService>(context).getDeviceAuthKey("9D3116A2-1948-45D4-BDBE-80CE2CFBCE20",'A12345',"cxzcxzcxzcxzczc","300001");
        Map authMap=jsonDecode(response.bodyString);
         var auth = AuthHttpGet.fromJson(authMap);
         var authToken = auth.api_current_token.toString();
         print(response.bodyString);
         
         SharedPreferencesTest.setAuthenticationKey(authToken);
         
        
        Future.delayed(Duration(seconds: 3),(){
           navigateToLoginScreen();
        });
      }        
  }
   
  @override
  Widget build(BuildContext context) {
   return StreamProvider(
      builder: (context) => HelperMethods().connectionStatusController.stream,
      child: Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CircularProgressIndicator()
          ), 
      ),
      ),
    );
  }

  void navigateToLoginScreen() {
    /// Push home screen and replace (close/exit) splash screen.
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen( )));
  }
}
