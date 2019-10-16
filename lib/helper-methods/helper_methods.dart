import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum ConnectivityStatus {
  WiFi,
  Cellular,
  Offline
}
class HelperMethods extends StatelessWidget{
  
    StreamController connectionStatusController = StreamController();
    HelperMethods() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }
  
  _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      getToast('Connected');
      break;
       // return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
      getToast('Connected');
      break;
        //return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
      getToast('Please check Internet Connection');
      break;
        //return ConnectivityStatus.Offline;
      default:
        //return ConnectivityStatus.Offline;
    }
  }



  static void getToast(String message){
     Fluttertoast.showToast(msg: message);
  }

 static void getProgressDialogue(){
    CircularProgressIndicator();
  }

 static Future<bool> checkInternetConnection() async{
       bool res=true;
    var connectivityResult = await (Connectivity().checkConnectivity());
       if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
              String message="Please check internet connection";
              getToast(message);
              res=false;
            } 
       return res;     
  }
  
   void firebaseNotification(){
    FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

    _firebaseMessaging.configure(
       onMessage: (Map<String, dynamic> message) async {
         print("onMessage: $message");
           Fluttertoast.showToast(msg: 'onMessage called \n' + message['notification']['title'].toString() +'\n' +message['notification']['body'].toString());
        
       },
       onLaunch: (Map<String, dynamic> message) async {
         print("onLaunch: $message");
            Fluttertoast.showToast(msg: 'onLaunch called'+'\n'+message['data']['title'].toString()+'\n' +message['data']['body'].toString());
         
       },
       onResume: (Map<String, dynamic> message) async {
         print("onResume:  $message");
            Fluttertoast.showToast(msg: 'onResume called'+'\n'+message['data']['title'].toString()+'\n' +message['data']['body'].toString());
            
       },
        
     );
     _firebaseMessaging.requestNotificationPermissions(
       const IosNotificationSettings(sound: true,badge: true,alert: true)
     );
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings){
      print("setting registred $settings");
    });
    
  }
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}