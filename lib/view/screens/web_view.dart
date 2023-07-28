import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);
final String url;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: WebView(initialUrl: url),),
      floatingActionButton:FloatingActionButton(onPressed:(){
        Get.back();
      },child:const Icon(Icons.arrow_back_outlined), ) ,
    );
  }
}
