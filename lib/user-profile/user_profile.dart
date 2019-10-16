
import 'package:flutter/material.dart';
import 'package:sample_project/shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
String imageUrl="";
String name="";
String email="";
String phone="";

@override
  void initState() {
    
      userDetails();
      super.initState(); 
    
  }

  //Initializing user profile
 userDetails() async{
  name = await SharedPreferencesTest.getUserName();
  email = await SharedPreferencesTest.getUserEmail();
  phone = await SharedPreferencesTest.getuserPhone();
 setState(() {

 });
  
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
       title: Text('Profile'),

     ),
     body: Column(
       children: <Widget>[

         new Container(
                width: 150.0,
                height: 150.0,
                decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage('assets/images/bg.jpeg'),
                 )
             )
         ),

         new Card(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Material(
                      //elevation: 24.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Name",style: TextStyle(
                          color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                        ),),
                      ),
                    ),
             ],
           ),
          ),
           new Card(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Material (
                      elevation: 24.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(name,style: TextStyle(
                          color: Colors.grey[800],
                          
                           
                        ),),
                      ),
                    ),
             ],
           ),
          ),
           new Card(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Material(
                      //elevation: 24.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Email",style: TextStyle(
                          color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                        ),),
                      ),
                    ),
             ],
           ),
          ),
           new Card(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Material(
                      elevation: 24.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(email,style: TextStyle(
                          color: Colors.grey[800],
                          
                           
                        ),),
                      ),
                    ),
             ],
           ),
          ),
           new Card(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Material(
                     // elevation: 24.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Phone ",style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                      ),
                    ),
             ],
           ),
          ),
           new Card(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Material(
                      elevation: 24.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(phone,style: TextStyle(
                          color: Colors.grey[800],
                          
                        ),),
                      ),
                    ),
             ],
           ),
          ),
          
       ],
     ) ,
    );
  }
}