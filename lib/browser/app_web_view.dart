import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatefulWidget {
  String webUrl;
  AppWebView(String s, {Key key}) : this.webUrl=s,super(key: key);
  _AppWebViewState createState() => _AppWebViewState(webUrl);
}

class _AppWebViewState extends State<AppWebView> {
Completer<WebViewController> _controller=Completer<WebViewController>();
String webUrl;
  _AppWebViewState(String webUrl):this.webUrl=webUrl ;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: new InkWell(
         child: Icon(Icons.arrow_back),
         onTap: (){
            Navigator.pop(context, false);
         },
       ),
       title: Text('Browser'),

     ),
      body: WebView(
        initialUrl: webUrl,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}