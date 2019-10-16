import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/api-service/api_service.dart';
import 'package:sample_project/change-password/change_password_http.dart';
import 'package:sample_project/shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key key}) : super(key: key);

  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentPswdController=new TextEditingController();
  TextEditingController newPswdController=new TextEditingController();
  TextEditingController cnfPswdController=new TextEditingController();
  String currentPswd,newPswd,cnfPswd;
  String deviceId='A12345';
  Map<String,String> changePassMap=new HashMap();

   Future changePassword(String authKey) async {
    final response= await Provider.of<PostApiService>(context).changePassword(deviceId,authKey,changePassMap);
    Map chPswdMap=jsonDecode(response.bodyString);
    var chPswdStatus=ChangePasswordHttpGet.fromJson(chPswdMap);
    return chPswdStatus.message ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: new InkWell(
         child: Icon(Icons.arrow_back),
         onTap: (){
           Navigator.pop(context,false);
         },
       ),
       title: Text('Change Password'),

     ),
     body: Container(
         child: Center(
          //  padding: const EdgeInsets.all(16.0),
           child:  Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Card(
                 child: TextField( 
                      controller: currentPswdController,
                      decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'Current password',
                                               ),
                  ),
            ),
             Card(
                child:  TextField( 
                      controller: newPswdController,
                      decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'New password',
                                               ),
                  ),
                  ),
               Card(    
                 child:  TextField( 
                      controller: cnfPswdController,
                      decoration: new InputDecoration(
                                               border: OutlineInputBorder(),
                                               hintText:'Confirm password',
                                               ),
                  ),
                  ),
          FlatButton(
             color: Colors.red,
            child: Text("Done"),
            onPressed: () async{
             currentPswd=currentPswdController.text;
             newPswd=newPswdController.text;
             cnfPswd=cnfPswdController.text;
             passwordConfirmation(currentPswd, newPswd, cnfPswd);
            }, 
           ),
          ],
           ),
         ),
     ),
    );
  }
  void passwordConfirmation(String currPass,String newPass,String cnfPass) async {
     String authKey= await SharedPreferencesTest.getAuthenticationKey();
    if(newPass==cnfPass){
      changePassMap['old_password']=currPass;
      changePassMap['new_password']=newPass;
      var message=changePassword(authKey);
      Fluttertoast.showToast(msg: message as String);
    }
    else{
      Fluttertoast.showToast(msg: 'new password not matched with confirm password');
    }
  }
}