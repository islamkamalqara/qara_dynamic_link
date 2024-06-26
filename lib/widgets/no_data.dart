

import 'package:flutter/material.dart';
import 'package:web_firebase_app/widgets/app_colors.dart';


class NoDataWidget extends StatelessWidget{
  String text = "";
  NoDataWidget({required this.text});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1 , ),
          child:  Center(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child:  Icon(Icons.do_not_disturb_alt,size: 50,),),
                  Text("${text}" ,
                    style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold),)
                ],

              )      ) ),
    );
  }

}
