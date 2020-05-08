import 'package:flutter/material.dart';
import 'data.dart';

final Color white = Colors.white;
final Color green = Colors.green;
final Color blue = Colors.blue;
final Color blue_1 = Color.fromRGBO(43, 113, 152, 1);
final Color black = Colors.black;
final Color black_1 = Colors.black54;
final Color red = Colors.red;
final Color  buttonColorBlue  =  Color(0xFF0079D1);


final TextStyle appbarText = TextStyle(color: blue,fontSize: width*7, fontWeight: FontWeight.w900);
final TextStyle inAppTitle = TextStyle(color: blue,fontSize: width*6, fontWeight: FontWeight.w600);
final TextStyle inAppSubTitle = TextStyle(color: blue,fontSize: width*5, fontWeight: FontWeight.w500);
final TextStyle tileTitle= TextStyle(color: blue_1, fontSize: width*5, fontWeight: FontWeight.w500,);
final TextStyle tileSubTitle = TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: width*3);
final TextStyle tileSubTitle_1 = TextStyle(color: blue, fontWeight: FontWeight.w400, fontSize: width*3);

mixin C{
  //others colors
  static Color get primaryBlue => const Color(0xFF0079D1);
  static Color get primaryBackgroundColor => const Color(0xFFFFFFFF);
  static Color get elevationShadowColor =>  Colors.grey.withOpacity(.36);
  static Color get bottomNavigationIconColor =>  Colors.grey;

  //text colors
  static Color get primaryTextBlue => const Color(0xFF0079D1);
  static Color get secondaryTextBlue => const Color(0xFF2C7198);
  static Color get primaryTextWhite=> const Color(0xFFFFFFFF);
  static Color get primaryTextRed=> const Color(0xFFEB5757);
  static Color get primaryTextGray=>  Colors.grey.withOpacity(.5);
  static Color get primaryTextBlack=>  Colors.black.withOpacity(.72);

  //gradient colors
  static Color get primaryGradientBlue =>  Color(0xFF0079D1);
  static Color get secondaryGradientBlue =>  Color(0xFF0064AD);
}