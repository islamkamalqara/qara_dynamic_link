import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_firebase_app/widgets/app_colors.dart';

class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          backgroundColor: AppColors.deepOrange,

        )
      ],
    );
  }

}