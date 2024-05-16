import 'package:flutter/material.dart';

class PoweredByWidget extends StatelessWidget {
  final Color? byColor;

  PoweredByWidget({
    Key? key,
    this.byColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Powered by",
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 7,
            fontWeight: FontWeight.w400,
            color: Color(0xffe74111),
            height: 11/7,
          ),
          textAlign: TextAlign.left,
        ),
        Image.asset("assets/qara_logo.png",
          width: 60,
          height: 30,
        )


      ],
    );
  }
}
