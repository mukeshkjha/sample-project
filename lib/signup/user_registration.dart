import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/api-service/api_service.dart';
import 'package:sample_project/login%20&%20home/login_screen.dart';
import 'package:sample_project/shared_preferences/shared_preferences.dart';
import 'package:sample_project/signup/register_http.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 TextEditingController firstNameController=new TextEditingController();
 TextEditingController lastNameController=new TextEditingController();
 TextEditingController emailController=new TextEditingController();
 TextEditingController passwordController=new TextEditingController();
 TextEditingController mobileController=new TextEditingController();

 Map<String,String> createUserMap=new HashMap();
  String deviceId='A12345';
  
  Future RegistrationResponse(String authKey) async {
     final response=await Provider.of<PostApiService>(context).getResistrationResponse(deviceId,authKey,createUserMap);
     Map registerMap=jsonDecode(response.bodyString);
     var rStatus=RegisterHttpGet.fromJson(registerMap);
     Fluttertoast.showToast(msg: rStatus.message);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen( )));
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: new InkWell(
         child: Icon(Icons.arrow_back),
         onTap: (){
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen( )));
         },
        ),
         title: Text('Registration'),
         
       ),
       body: Column(
         children: <Widget>[
            TextField(
               
               controller: firstNameController,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'First-Name',
                                               ),
                  ),
            TextField(
               
               controller: lastNameController,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'Last-Name',
                                               ),
                  ),
            TextField(
               controller: emailController,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'Email',
                                               ),
                  ),
            TextField(
               obscureText: true, 
               controller: passwordController,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'Password',
                                               ),
                  ),
            TextField(
               controller: mobileController,
               decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'Phone',
                                               ),
                  ),
            
            FlatButton(
             color: Colors.red,
            child: Text("Register"),
            onPressed: () {
                 CreateUserFunction();
            }, 
           ),
         ],
       ),
    );
  }
  Future CreateUserFunction() async {
          String authKey= await SharedPreferencesTest.getAuthenticationKey();
                
                    createUserMap['first_name'] = firstNameController.text;
                    createUserMap['last_name'] = lastNameController.text;
                    createUserMap['email'] = emailController.text;
                    createUserMap['password'] = passwordController.text;
                    createUserMap['phone'] = mobileController.text;
                    createUserMap['role'] = '100001';
                    createUserMap['user_type'] = '150002';
                    createUserMap['is_social'] = '0';
                    createUserMap['social_id'] = '0';
                    RegistrationResponse(authKey);   
  }
}