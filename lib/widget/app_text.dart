import 'package:flutter/material.dart';
class AppText extends StatelessWidget {
  final String text;
  final Color color;

  final double fontsize;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  final double? letterSpacing;

  AppText({ required this.text, required this.color,required  this.fontsize,  this.fontWeight, this.textAlign=TextAlign.start, this.letterSpacing,});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
        color: color,
    letterSpacing:letterSpacing,
    fontSize:fontsize,
    fontFamily: 'Poppins',
    fontWeight: fontWeight,
    ),
    );
  }
}
