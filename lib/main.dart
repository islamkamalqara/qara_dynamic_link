import 'package:flutter/material.dart';
import 'package:web_firebase_app/base/network/config.dart';
import 'package:web_firebase_app/view/refeering_screen.dart';
import 'dart:html' as html;
import 'package:web_firebase_app/view/inital_screen.dart';
import 'package:web_firebase_app/view/redirect_to_store_screen.dart';

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
      home: getAppScreen()
      /* inputQrValue == null ? IntialScreen() : ActionScreen(
         qrCode: inputQrValue!
      ),*/
    );
  }
}

Widget getAppScreen(){
  switch(type){
    case 'qr':
      if(appName != null)
        return RedirectToStoreScreen(  appName: appName!);
        else
      return IntialScreen();
      break;
    case 'ref' :
      if(appName != null)
        if(id == null)
          return  RefeeringScreen( appName!);
        else
          return  RefeeringScreen( appName!,id!);
      else
        return IntialScreen();

      break;
      default:
      return  IntialScreen();
  }
}
void getParams() {
  var uri = Uri.dataFromString(html.window.location.href);
  Map<String, String> params = uri.queryParameters;
 // inputQrValue = params['qr'];
  type = params['type'];
  id = params['id'];
  appName = params['appName'];

}