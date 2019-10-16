import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/api-service/api_service.dart';
import 'package:sample_project/forgot-password/forgot_password_http.dart';
import 'package:sample_project/login%20&%20home/login_screen.dart';
import 'package:sample_project/shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController=new TextEditingController();
  String deviceId='A12345';
  Map<String,String> passwordMap = new HashMap();

  Future ForgotPasswordResponse(var authKey) async {
    final response= await Provider.of<PostApiService>(context).forgetPassword(deviceId,authKey,passwordMap);
    Map passMap=jsonDecode(response.bodyString);
    var pStatus=ForgotPasswordHttpGet.fromJson(passMap);
    Fluttertoast.showToast(msg: pStatus.message);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen( )));
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:new InkWell(
         child: Icon(Icons.arrow_back),
         onTap: (){
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen( )));
         },
        ),
        title: Text('ForgotPassword'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
               controller: emailController,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'YourEmail',
                                               ),
                  ),
          FlatButton(
             color: Colors.red,
            child: Text("Done"),
            onPressed: () async{
              passwordMap['email']=emailController.text;
              var authKey= await SharedPreferencesTest.getAuthenticationKey();
             
              ForgotPasswordResponse(authKey);
            }, 
           ),
        ],
      ),
    );
  }
}