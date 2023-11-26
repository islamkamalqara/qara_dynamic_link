import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RefeeringScreen extends StatefulWidget {
  final String referringId;
  final String appName;
  RefeeringScreen(this.appName, [this.referringId = ""]);
  @override
  State<StatefulWidget> createState() {
    return RefeeringScreenState();
  }
}

class RefeeringScreenState extends State<RefeeringScreen> {
  String platform = "";

  @override
  void initState() {
    //use this part of code to hide query params from url
    String data = "";
    window.history.replaceState(data, "", data);
    super.initState();
  }

  String getOSInsideWeb() {
    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    if (userAgent.contains("iphone")) return "ios";
    if (userAgent.contains("ipad")) return "ios";
    if (userAgent.contains("android")) return "Android";
    return "Web";
  }

/*  void redirectUserDirectlyToStore(){
  platform = getOSInsideWeb();
  switch(platform){
    case "Android":
      switch(widget.referringId){
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
      switch(widget.referringId){
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
}*/

  void redirctUserToAppleStore() {
    switch (widget.appName) {
      case 'HSE-KSA':
        Clipboard.setData(ClipboardData(text: widget.referringId))
            .whenComplete(() {
          window.open(
              'https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065',
              'new tab');
        });
        break;
      case 'WNCC':
        Clipboard.setData(new ClipboardData(text: widget.referringId))
            .whenComplete(() {
          window.open(
              'https://apps.apple.com/eg/app/%D8%A7%D8%B5%D8%AF%D9%82%D8%A7%D8%A1-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%8A/id1605464573',
              'new tab');
        });
        break;
      case 'KZ':
        Clipboard.setData(new ClipboardData(text: widget.referringId))
            .whenComplete(() {
          window.open(
              'https://apps.apple.com/eg/app/%D8%A7%D9%84%D9%85%D8%A4%D8%AA%D9%85%D8%B1-%D8%A7%D9%84%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF%D9%8A/id6443584694',
              'new tab');
        });
        break;
    }
  }

  void redirectUserToGooglePlay() {
    switch (widget.appName) {
      case 'HSE-KSA':
        Clipboard.setData(new ClipboardData(text: widget.referringId))
            .whenComplete(() {
          window.open(
              'https://play.google.com/store/apps/details?id=com.qara.hse',
              'new tab');
        });
        break;
      case 'WNCC':
        Clipboard.setData(new ClipboardData(text: widget.referringId))
            .whenComplete(() {
          window.open(
              'https://play.google.com/store/apps/details?id=net.qara.wncc',
              'new tab');
        });
        break;
      case 'KZ':
        Clipboard.setData(new ClipboardData(text: widget.referringId))
            .whenComplete(() {
          window.open(
              'https://play.google.com/store/apps/details?id=net.qara.kz',
              'new tab');
        });
        break;
    }
  }

  String getAppIcon() {
    switch (widget.appName) {
      case 'HSE-KSA':
        return "assets/HSE_Logo.png";
        break;
      case 'WNCC':
        return "assets/WNCC_logo.png";
        break;
      case 'KZ':
        return "assets/KZ_Logo.png";
        break;
      default:
        return "assets/Character.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: /* platform == "Web" ? */ Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors
                    .transparent, // Set background color to transparent to see the image
                child: ClipOval(
                  child: Image(
                    image: AssetImage(getAppIcon()),
                    fit: BoxFit.cover,
                    // You can change the BoxFit to modify how the image fits within the circle
                  ),
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text("you can download App")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  redirctUserToAppleStore();

                  /*
                             publicScanBloc.add(GetPublicScanData(qr_value: widget.qrCode));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShowDataScreen(qrCode: widget.qrCode)),
                                ModalRoute.withName("/IntialScreen"));*/
                },
                borderRadius: BorderRadius.circular(15),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/apple_store.png',
                      width: 100,
                      height: 50,
                      fit: BoxFit.fitWidth,
                    )),
              ),
              InkWell(
                  onTap: () {
                    redirectUserToGooglePlay();

                    /*
                             publicScanBloc.add(GetPublicScanData(qr_value: widget.qrCode));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShowDataScreen(qrCode: widget.qrCode)),
                                ModalRoute.withName("/IntialScreen"));*/
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/play_store.png',
                      width: 100,
                      height: 50,
                      fit: BoxFit.fitWidth,
                    ),
                  )),
            ],
          )
        ],
      )
          /*: Image.asset("assets/qara_logo.png")*/
          ),
    );
  }
}
