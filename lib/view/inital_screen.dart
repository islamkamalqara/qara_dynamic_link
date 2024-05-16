import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntialScreen extends StatelessWidget{
  final String message;
  IntialScreen({required this.message});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Text(message??"Page Not Found"),
     ),
   );
  }

}