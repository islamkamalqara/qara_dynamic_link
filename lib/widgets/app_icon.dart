import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_firebase_app/base/network/config.dart';

class AppIcon extends StatefulWidget{
  final String appLogo;
  final String appName;
  AppIcon({required this.appLogo,required this.appName});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppIconState();
  }

}

class AppIconState extends State<AppIcon>{

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child:appName != "HSE-KSA" ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child:  Image(
            image: AssetImage( widget.appLogo),
            fit: BoxFit.cover,
            // You can change the BoxFit to modify how the image fits within the circle
          ),
        ) :CircleAvatar(
          radius: 35.0,
          backgroundColor: Colors.transparent, // Set background color to transparent to see the image
          child: ClipOval(
            child: Image(
              image: AssetImage( widget.appLogo),
              fit: BoxFit.cover,
              // You can change the BoxFit to modify how the image fits within the circle
            ),
          ),
        ));
  }
}