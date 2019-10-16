import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/api-service/api_service.dart';
import 'package:sample_project/forgot-password/forgot_password.dart';
import 'package:sample_project/helper-methods/helper_methods.dart';
import 'package:sample_project/login%20&%20home/home.dart';
import 'package:sample_project/login%20&%20home/login_http.dart';
import 'package:sample_project/shared_preferences/shared_preferences.dart';
import 'package:sample_project/signup/user_registration.dart';
import 'package:sample_project/splash/http_getter.dart';
import 'package:sample_project/user-profile/user_profile_http.dart';

 class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
TextEditingController emailController=new TextEditingController();
TextEditingController passwordController=new TextEditingController();
String email,password;

Map<String,String> param=new HashMap();
AuthHttpGet authHttpGet=new AuthHttpGet();

String userId='5';
String deviceId= 'A12345';



//login api call
Future getLoginResponse(String authKey) async {
  final response= await Provider.of<PostApiService>(context).getLoginResponse('A12345',authKey,param);
  Map loginMap=jsonDecode(response.bodyString);
  var detail=LoginHttpGet.fromJson(loginMap);
   print(response.bodyString);
  if(detail.status==1 && detail.code==200){
    userProfile();
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
 HelperMethods.getToast(detail.message); 
}

//User-Profile api call

Future userProfile() async{
   String authKey = await SharedPreferencesTest.getAuthenticationKey();
  final response= await Provider.of<PostApiService>(context).getUserProfile(deviceId,authKey,userId);
 Map profMap=jsonDecode(response.bodyString);
 var profData= UserProfileHttpGet.fromJson(profMap);
 SharedPreferencesTest.setUserName(profData.data.first_name+' '+profData.data.last_name);
 SharedPreferencesTest.setUserEmail(profData.data.email);
 SharedPreferencesTest.setuserPhone(profData.data.phone);
 print(response.bodyString);
}

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      builder: (context) => HelperMethods().connectionStatusController.stream,
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login Screen"),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          TextField(
               controller: emailController,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'Email',
                                               ),
                  ),
          TextField( 
            controller: passwordController,
               obscureText: true,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'password',
                                               ),
                  ),
          FlatButton(
             color: Colors.red,
            child: Text("Login"),
            onPressed: () async{
              email=emailController.text;
              password=passwordController.text;
              param['username']=email;
              param['password']=password;
              // param['phone']='';
              // param['is_social']='1';
              // param['social_id']='350001';
              // param['first_name']='';
              // param['last_name']='';
              //  param['gender']='';
             String authKey= await SharedPreferencesTest.getAuthenticationKey();
              print('authKeyString'+' '+authKey);
              getLoginResponse(authKey);
            }, 
           ),
        Row(
          children: <Widget>[
            Expanded(
              child: new InkWell(
                onTap: (){NavigateToForgotPasswordScreen();},
                child: Text('Forgot Password'),
              ),
            ),
            Expanded(
              child: new InkWell(
                onTap: (){NavigateToRegisterScreen();},
                child: Text('Not Register Yet?'),
              ),
            ),
          ],
        )  
                
          
        ],
        ),
    ),
    );
       
  }
 void NavigateToRegisterScreen(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
  }
  void NavigateToForgotPasswordScreen(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
  }
}


  
  
  
