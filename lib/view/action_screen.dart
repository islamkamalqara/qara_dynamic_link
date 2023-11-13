import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_firebase_app/view/show_data_screen.dart';

class ActionScreen extends StatelessWidget{
  final String qrCode;
  ActionScreen({required this.qrCode});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              child: ClipOval(
                child: Material(
                  color: Colors.blue, // Button color
                  child: InkWell(
                    splashColor:
                    Colors.red, // Splash color
                    onTap: () {

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> ShowDataScreen(qrCode: qrCode)));
                    },
                    child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.ads_click)),
                  ),
                ),
              )),
        ],
      ),
    );
  }

}