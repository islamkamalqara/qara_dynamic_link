

import 'package:flutter/material.dart';
import 'package:web_firebase_app/widgets/app_colors.dart';

Widget no_data_widget({BuildContext? context, String? text}) {
  return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context!).size.width * 0.1 , ),
  child:  Center(
//    color: whiteColor,
      child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.do_not_disturb_alt,size: 50,),
        Text("${text}" ,
        style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold),)
      ],

      )      ) );
}
