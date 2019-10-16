
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/api-service/api_service.dart';
import 'package:sample_project/browser/app_web_view.dart';
import 'package:sample_project/change-password/change_password.dart';
import 'package:sample_project/helper-methods/helper_methods.dart';
import 'package:sample_project/login%20&%20home/login_screen.dart';
import 'package:sample_project/shared_preferences/shared_preferences.dart';
import 'package:sample_project/user-profile/user_profile.dart';

class HomePage extends StatefulWidget {
  HomePage( {Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 String name='',email='',phone='',imagePath='';
 
  @override
  void initState() {
       userDetails();
    super.initState();
    
  
  }
  //initializing user details

   void userDetails() async{
        name = await SharedPreferencesTest.getUserName();
        email = await SharedPreferencesTest.getUserEmail();
        phone = await SharedPreferencesTest.getuserPhone();
        setState(() {
          
        });
} 
 

  @override
  Widget build(BuildContext context) {
   return StreamProvider(
      builder: (context) => HelperMethods().connectionStatusController.stream,

   child: new Scaffold (
     
      drawer: new Drawer(
         child: new ListView(
    children: <Widget>[
      new DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           new Container(
                width:50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage('assets/images/bg.jpeg'),
                 )
             )
         ),
      
               Expanded(       
                 child:Text(name,style: TextStyle(
                          color: Colors.grey[800],
                           backgroundColor: Colors.orange,
                           fontWeight: FontWeight.bold,
                           
                        ),),),
               Expanded(      
                 child:Text(email,style: TextStyle(
                          color: Colors.grey[800],
                           backgroundColor: Colors.orange,
                           fontWeight: FontWeight.bold,
                        ),),),
                  
         
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.orange
        ),
        
      ),
         ListTile(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
           },
           title: Text('Profile'),
         ),
          ListTile(
           title: Text('ChangePassword'),
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
           },
         ),
          
          ListTile(
           title: Text('Notification'),
           onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context) => PushNotification()));
           },
         ),
          ListTile(
           title: Text('Privacy Policy'),
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => AppWebView('https://www.website.com/about-us/')));
           }
         ),
          ListTile(
           title: Text('About Us'),
           onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppWebView('https://www.website.com/about-us/')));
           },
         ),
          ListTile(
           title: Text('Terms and Condition'),
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => AppWebView('https://en.wikipedia.org/wiki/Terms_of_service')));
             },
         ),
         ListTile(
           title: Text('Logout'),
           onTap: () async{
             String authKey= await SharedPreferencesTest.getAuthenticationKey();
             final response= await Provider.of<PostApiService>(context).logout('A12345',authKey);
             print(response.bodyString);
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
           },
         ),
        
       ],
      ),
    
      ),
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: Text('Hello world'),
      // body: Text('Body content'),
   ),
    );
  }
}