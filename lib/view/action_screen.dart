import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ActionScreen extends StatefulWidget{
  final String qrCode;
  ActionScreen({required this.qrCode});
  @override
  State<StatefulWidget> createState() {
    return ActionScreenState();
  }
}
class ActionScreenState extends State<ActionScreen> {
  String platform = "";
  @override
  void initState() {

      platform = getOSInsideWeb();
      switch(platform){
        case "Android":
          switch(widget.qrCode){
            case 'hse':
              window.open('https://play.google.com/store/apps/details?id=com.qara.hse', 'new tab');
              break;
            case 'wncc':
              window.open('https://play.google.com/store/apps/details?id=net.qara.wncc', 'new tab');
              break;
            case 'kz':
              window.open('https://play.google.com/store/apps/details?id=net.qara.kz', 'new tab');
              break;
          }
          // window.open('https://play.google.com/store/apps/details?id=com.qara.hse', 'new tab');
          break;
        case 'ios':
          switch(widget.qrCode){
            case 'hse':
              window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');
              break;
            case 'wncc':
              window.open('https://apps.apple.com/eg/app/%D8%A7%D8%B5%D8%AF%D9%82%D8%A7%D8%A1-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%8A/id1605464573', 'new tab');
              break;
            case 'kz':
              window.open('https://apps.apple.com/eg/app/%D8%A7%D9%84%D9%85%D8%A4%D8%AA%D9%85%D8%B1-%D8%A7%D9%84%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF%D9%8A/id6443584694', 'new tab');
              break;
          }

          // window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');
          break;
        default:
          break;
      }

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: platform == "Web" ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("Operating System : ${platform}")),

            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("you can download App")),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               InkWell(
                          onTap: (){
                            switch(widget.qrCode){
                              case 'hse':
                                window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');
                                break;
                              case 'wncc':
                                window.open('https://apps.apple.com/eg/app/%D8%A7%D8%B5%D8%AF%D9%82%D8%A7%D8%A1-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%8A/id1605464573', 'new tab');
                                break;
                              case 'kz':
                                window.open('https://apps.apple.com/eg/app/%D8%A7%D9%84%D9%85%D8%A4%D8%AA%D9%85%D8%B1-%D8%A7%D9%84%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF%D9%8A/id6443584694', 'new tab');
                                break;
                            }
                              /*  window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');

                             publicScanBloc.add(GetPublicScanData(qr_value: widget.qrCode));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShowDataScreen(qrCode: widget.qrCode)),
                                ModalRoute.withName("/IntialScreen"));*/
                          },
                          child: Image.asset('assets/apple_store.png',
                            width: 130,
                            height: 50,
                            fit: BoxFit.fitWidth,
                          ),

                ),
                InkWell(
                          onTap: (){
                            switch(widget.qrCode){
                              case 'hse':
                                window.open('https://play.google.com/store/apps/details?id=com.qara.hse', 'new tab');
                                break;
                              case 'wncc':
                                window.open('https://play.google.com/store/apps/details?id=net.qara.wncc', 'new tab');
                                break;
                              case 'kz':
                                window.open('https://play.google.com/store/apps/details?id=net.qara.kz', 'new tab');
                                break;
                            }
                   /*             window.open('https://play.google.com/store/apps/details?id=com.qara.hse', 'new tab');
                             publicScanBloc.add(GetPublicScanData(qr_value: widget.qrCode));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShowDataScreen(qrCode: widget.qrCode)),
                                ModalRoute.withName("/IntialScreen"));*/
                          },
                          child: Image.asset('assets/play_store.png',
                            width: 130,
                            height: 50,
                            fit: BoxFit.fitWidth,),
                         ),
              ],
            )


          ],
        ) : Image.asset("assets/qara_logo.png"),
      ),
    );
  }
}
