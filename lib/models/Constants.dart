import 'package:flutter/material.dart';

Color mPrimaryColor = Color(0xff2e6ac9);
Color mScaffoldBackGroundColor = Color(0xffededed);

//this function to formmat date ,EX: from '6' to '06' as string , to use it in API url
String formatNumber(int number) {
  String res = '';
  if (number < 10) {
    res = '0$number';
  } else {
    res = number.toString();
  }
  return res;
}
