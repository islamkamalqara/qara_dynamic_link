import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_icon.dart';
import '../widgets/powered_by_widget.dart';
import '../widgets/welcome_widget.dart';

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
  String welcomeAppText = "";
  String appLogo = "";
  String appScreen = "";
  Color? color ;
  @override
  void initState() {
    platform = getOSInsideWeb();
    redirectUserDirectlyToStore();
    getAppIcon();

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
          case 'RABEH':
            window.open(
                'https://qara.net/',
                'new tab');
            break;
        }
        break;
      case 'ios':
        switch(widget.appName){
          case 'HSE-KSA':
            window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');
            break;
          case 'WNCC':
            window.open(
                'https://qara.net/',
                'new tab');
            break;
          case 'KZ':
            window.open(
                'https://apps.apple.com/eg/app/kz/id6474090555', 'new tab');
            break;
          case 'RABEH':
            window.open(
                'https://qara.net/',
                'new tab');
            break;
        }
        break;
      default:
        break;
    }
  }

  getAppIcon() {
    switch (widget.appName) {
      case 'HSE-KSA':
        welcomeAppText = "برنامج حوافز السويدى";
        appLogo = "assets/HSE_Logo.png";
        appScreen = platform == "Web" ? "assets/web/hse_ksa_web.png" : "assets/app_screen/hse_app_screen.png";
        color = Color(0xFFEC6707);
        break;
      case 'WNCC':
        welcomeAppText = "برنامج حوافز وادي النيل";
        appLogo =  "assets/WNCC_logo.png";
        appScreen = platform == "Web" ? "assets/web/wncc_web.png" : "assets/app_screen/wncc_app_screen.png";
        color = Color(0xFF88B71B);
        break;
      case 'KZ':
        welcomeAppText = "برنامج حوافز شركة كفر الزيات";
        appLogo =  "assets/KZ_Logo.png";
        appScreen = platform == "Web" ? "assets/web/kz_web.png" : "assets/app_screen/kz_app_screen.png";
        color = Color(0xFF49A33F);
        break;
      case 'RABEH':
        welcomeAppText = "برنامج حوافز رابح";
        appScreen = platform == "Web" ? "assets/web/rabeh_web.png" : "assets/app_screen/rabeh_app_screen.png";
        appLogo =  "assets/RABAH_logo.png";
        color = Color(0xFF49B28D);
        break;
      default:
        welcomeAppText = "برنامج حوافز السويدى";
        appLogo = "assets/HSE_Logo.png";
        appScreen = platform == "Web" ?  "assets/web/hse_ksa_web.png" : "assets/app_screen/hse_app_screen.png";
        color = Color(0xFFEC6707);
        break;
    }
  }

  void redirctUserToAppleStore() {
    switch (widget.appName) {
      case 'HSE-KSA':
        window.open('https://apps.apple.com/eg/app/hse-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AD%D9%88%D8%A7%D9%81%D8%B2-%D8%A7%D9%84%D8%B3%D9%88%D9%8A%D8%AF%D9%89/id6444411065', 'new tab');
        break;
      case 'WNCC':
        window.open(
            'https://qara.net/',
            'new tab');
        break;
      case 'KZ':
        window.open(
           'https://apps.apple.com/eg/app/kz/id6474090555', 'new tab');
        break;
      case 'RABEH':
        window.open(
            'https://qara.net/',
            'new tab');
        break;
    }
  }

  void redirectUserToGooglePlay() {
    switch (widget.appName) {
      case 'HSE-KSA':
        window.open(
            'https://play.google.com/store/apps/details?id=com.qara.hse',
            'new tab');
        break;
      case 'WNCC':
        window.open(
            'https://play.google.com/store/apps/details?id=net.qara.wncc',
            'new tab');
        break;
      case 'KZ':
        window.open('https://play.google.com/store/apps/details?id=net.qara.kz',
            'new tab');
      case 'RABEH':
        window.open(
            'https://qara.net/',
            'new tab');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:   platform == "Web" ?  Container(
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
                flex:8,
                child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 30),
                            child:   Image(
                              image: AssetImage(appScreen),
                              fit: BoxFit.cover,
                            ),),
                          Positioned(
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: MediaQuery.of(context).size.width * 0.1,
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
                            ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * 0.15,
                            child: WelcomeWidget(welcomeText: welcomeAppText),
                          )
                        ],
                      )
                    ])

            ),

            Expanded(
                flex: 1,
                child:  Center(child:  PoweredByWidget(),))

          ],
        ),
      )  :  Center(
    child: Image.asset("assets/qara_logo.png")
    ),

    );

  }

}
