import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_firebase_app/widgets/app_icon.dart';
import 'package:web_firebase_app/widgets/no_data.dart';
import 'package:web_firebase_app/widgets/powered_by_widget.dart';
import 'package:web_firebase_app/widgets/welcome_widget.dart';

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
  String welcomeAppText = "";
  String appLogo = "";
  String appScreen = "";
  Color? color ;
  @override
  void initState() {
    platform = getOSInsideWeb();
    getAppIcon();
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
      case 'RABEH':
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
      case 'RABEH':
        Clipboard.setData(new ClipboardData(text: widget.referringId))
            .whenComplete(() {
          window.open(
              'https://play.google.com/store/apps/details?id=net.qara.wncc',
              'new tab');
        });
        break;
    }
  }

   getAppIcon() {
    switch (widget.appName) {
      case 'HSE-KSA':
        welcomeAppText = "برنامج حوافز السويدى";
        appLogo = "assets/HSE_Logo.png";
        appScreen = platform == "Web" ? "assets/web_hse_image.png" : "assets/app_screen/hse_app_screen.png";
        color = Color(0xFFEC6707);
        break;
      case 'WNCC':
        welcomeAppText = "برنامج حوافز وادي النيل";
        appLogo =  "assets/WNCC_logo.png";
        appScreen = "assets/app_screen/wncc_app_screen.png";
        color = Color(0xFF88B71B);
        break;
      case 'KZ':
        welcomeAppText = "برنامج حوافز شركة كفر الزيات";
        appLogo =  "assets/KZ_Logo.png";
        appScreen = "assets/app_screen/kz_app_screen.png";
        color = Color(0xFF49A33F);
        break;
      case 'RABEH':
        welcomeAppText = "برنامج حوافز رابح";
        appScreen = "assets/app_screen/rabeh_app_screen.png";
        appLogo =  "assets/RABAH_logo.png";
        color = Color(0xFF49B28D);
        break;
      default:
        welcomeAppText = "برنامج حوافز السويدى";
        appLogo = "assets/HSE_Logo.png";
        appScreen = platform == "Web" ? "assets/web_hse_image.png" : "assets/app_screen/hse_app_screen.png";
        color = Color(0xFFEC6707);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:   appScreen == "" || appLogo == ""  ?  NoDataWidget( text: "No Data !!")
          : Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png",),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 1,
                child: AppIcon(appLogo: appLogo,appName: widget.appName,)),

            Expanded(
                flex: 7,
                child: platform == "Web" ?  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    redirctUserToAppleStore();
                                  },
                                  borderRadius: BorderRadius.circular(15),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/apple_store.png',
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                                SizedBox(height: 38,),
                                InkWell(
                                  onTap: () {
                                    redirectUserToGooglePlay();
                                  },
                                  borderRadius: BorderRadius.circular(15),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/google_play.png',
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                              ],
                            )),

                        Expanded(child: Center(
                          child: Image(
                            image: AssetImage(appScreen),
                            fit: BoxFit.cover,
                          ),
                        ),
                        ),
                        Expanded(child:  WelcomeWidget(welcomeText: welcomeAppText),
                        ),





                      ],
                    )
                    : Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        Stack(
                          children: [
                           Image(
                                image: AssetImage(appScreen),
                                fit: BoxFit.cover,
                              ),

                            Positioned(
                              top:0,
                              left: 10,
                              right: 10,
                              child:  Column(
                                children: [
                                  WelcomeWidget(welcomeText: welcomeAppText),

                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 10,
                              right: 10,
                              child:  Column(
                                children: [

                                  InkWell(
                                    onTap: () {
                                      switch(platform){
                                        case 'Android':
                                          redirectUserToGooglePlay();
                                          break;
                                        case 'ios':
                                          redirctUserToAppleStore();
                                          break;
                                      }
                                    },

                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: color ,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Text("حمل التطبيق الآن",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Tajawal',
                                          fontSize: 18.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                        ),textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        )



                      ],
                    ),
                  ),
                )
            ),

            Expanded(
                flex: 1,
                child:  Center(child:  PoweredByWidget(),))

          ],
        ),
      ) ,

    );

  }

}
