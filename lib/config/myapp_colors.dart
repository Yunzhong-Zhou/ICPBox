// 颜色配置
import 'package:flutter/material.dart';

class MyAppColor {
  static const Color primary = Color(0xFF3555FF);

  static const Color success = Color(0xff07c160);

  static const Color danger = Color(0xffee0a24);

  static const Color warning = Color(0xffffba00);

  static const Color info = Color(0xff00a1d6);

  static const Color active = Color(0xff464646);

  static const Color unactive = Color(0xff7b7b7b);

  static const Color un2active = Color(0xff8d8d8d);

  static const Color un3active = Color(0xffb1b1b1);

  static const Color page = Color(0xFFF6F6F6);

  static const Color nav = Color(0xfffbfbfb);

  static const Color border = Color(0xfff5f5f5);

  static const Color white = Color(0xffffffff);
  static const Color white1 = Color(0xa6ffffff);
  static const Color white2 = Color(0x66ffffff);
  static const Color white3 = Color(0x33ffffff);

  static const Color black = Color(0xff000000);
  static const Color black1 = Color(0xff333333);
  static const Color black2 = Color(0xff666666);
  static const Color black3 = Color(0xff999999);
  static const Color black4 = Color(0xffCECECE);
  static const Color black5 = Color(0xffF2F2F2);


  // 颜色值转换
  static Color string2Color(String colorString) {
    int? value = 0x00000000;
    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }
      value = int.tryParse(colorString, radix: 16);
      if (value != null) {
        if (value < 0xFF000000) {
          value += 0xFF000000;
        }
      }
    }
    return Color(value!);
  }
}