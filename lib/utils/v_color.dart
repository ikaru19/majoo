import 'dart:ui';

import 'package:flutter/material.dart';

class VColor {
  static const Color main = Color(0xFF224062);
  static const Color accent = Color(0xFF00A3B4);
  static const Color grey = Color.fromRGBO(34, 64, 98, 0.5);
  static const Color greyText = Color(0xff828282);
  static const Color orange = Color(0xFFFCAF17);
  static const Color chatMe = Color(0xff99CEDE);
  static const Color chatYou = Color(0xffE6E6E6);


  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff0082A8), Color(0xff00A3B4)],
    stops: [0, 1],
  );
}
