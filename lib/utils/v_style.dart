import 'package:flutter/material.dart';

class VStyle {
  static BoxDecoration boxShadow({color = Colors.white, radius = 8.0}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [shadow()],
    );
  }

  static BoxDecoration boxShadowOutline(
      {color = Colors.white, radius = 8.0, borderColor}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
      boxShadow: [shadow()],
    );
  }

  static shadow() {
    return BoxShadow(blurRadius: 8.0, color: Colors.black12);
  }

  static BoxDecoration corner({radius = 8.0}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
