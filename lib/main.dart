
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/splash/splashScreen.dart';

import 'api-service/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
     builder: (_)=> PostApiService.create(),
     dispose: (context,PostApiService service) => service.client.dispose(),
     child: MaterialApp(
       home: SplashScreen(),
     ),
    );
  }
}

