import 'dart:ui';

import 'package:flutter/material.dart';

class VColor {
  static const Color main = Color(0xFF224062);
  static const Color accent = Color(0xFF00A3B4);
  static const Color grey = Color.fromRGBO(34, 64, 98, 0.5);
  static const Color greyText = Color(0xff828282);
  static const Color orange = Color(0xFFFCAF17);
  static const Color red = Color(0xFFEA4335);
  static const Color red_dark = Color(0xFFE94057);
  static const Color dark_pink = Color(0xFF8A2387);
  static const Color light_orange2 = Color(0xFFF27121);
  static const Color light_orange = Color(0xFFFFA36A);
  static const Color bgColorHome = Color(0xFF232331);


  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff0082A8), Color(0xff00A3B4)],
    stops: [0, 1],
  );

  static const gradient2 =  LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [red_dark,light_orange2,dark_pink,light_orange2]);


}
