import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedirectToStoreScreen extends StatefulWidget{
  final String appName;
  RedirectToStoreScreen({required this.appName});
  @override
  State<StatefulWidget> createState() {
    return RedirectToStoreScreenState();
  }
}
class RedirectToStoreScreenState extends State<RedirectToStoreScreen> {
  String platform = "";

  @override
  void initState() {

    redirectUserDirectlyToStore();


    //use this part of code to hide query params from url
    String data ="";
    window.history.replaceState(data, "", data);
    super.initState();
  }

  String getOSInsideWeb() {
    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    if( userAgent.contains("iphone"))  return "ios";
    if( userAgent.contains("ipad")) return "ios";
    if( userAgent.contains("android"))  return "Android";
    return "Web";
  }

  void redirectUserDirectlyToStore(){
    platform = getOSInsideWeb();
    switch(platform){

      case "Android":
        switch(widget.appName){
          case 'HSE-KSA':
            window.open('https://play.google.com/store/apps/details?id=com.qara.hse', 'new tab');
            break;
          case 'WNCC':
            window.open('https://play.google.com/store/apps/details?id=net.qara.wncc', 'new tab');
            break;
          case 'KZ':
            window.open('https://play.google.com/store/apps/details?id=net.qara.kz', 'new tab');
            break;
        }
        break;
      case 'ios':
        switch(widget.appName){
          case 'HSE-KSA':
            window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');
            break;
          case 'WNCC':
            window.open('https://apps.apple.com/eg/app/%D8%A7%D8%B5%D8%AF%D9%82%D8%A7%D8%A1-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%8A/id1605464573', 'new tab');
            break;
          case 'KZ':
            window.open('https://apps.apple.com/eg/app/%D8%A7%D9%84%D9%85%D8%A4%D8%AA%D9%85%D8%B1-%D8%A7%D9%84%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF%D9%8A/id6443584694', 'new tab');
            break;
        }
        break;
      case 'Web':
        switch(widget.appName){
          case 'HSE-KSA':
            window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');
            break;
          case 'WNCC':
            window.open('https://apps.apple.com/eg/app/%D8%A7%D8%B5%D8%AF%D9%82%D8%A7%D8%A1-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%8A/id1605464573', 'new tab');
            break;
          case 'KZ':
            window.open('https://apps.apple.com/eg/app/%D8%A7%D9%84%D9%85%D8%A4%D8%AA%D9%85%D8%B1-%D8%A7%D9%84%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF%D9%8A/id6443584694', 'new tab');
            break;
        }
        break;
      default:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: Image.asset("assets/qara_logo.png")
      ),
    );
  }

}
