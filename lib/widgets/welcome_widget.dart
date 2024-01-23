import 'package:flutter/cupertino.dart';

class WelcomeWidget extends StatelessWidget{
  final String welcomeText;
  WelcomeWidget({required this.welcomeText});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "مرحبا بك في",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.right,
        ) ,
        SizedBox(height: 10,),
        Text(
          welcomeText,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.center,
        )
      ],
        ),
    );
  }

}