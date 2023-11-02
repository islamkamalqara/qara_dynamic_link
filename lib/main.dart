import 'package:flutter/material.dart';
import 'package:web_firebase_app/base/network/config.dart';
import 'package:web_firebase_app/hosting/home_screen.dart';
import 'dart:html' as html;
void main() {
  getParams();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("#inputQrValue : ${inputQrValue}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(
         qrCode: inputQrValue??"qara.net?-ORDER-lob18a18gzxus687223zn123"
      ),
    );
  }
}

void getParams() {
  var uri = Uri.dataFromString(html.window.location.href);
  Map<String, String> params = uri.queryParameters;
  inputQrValue = params['qr'];
}