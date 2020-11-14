import 'package:flutter/material.dart';
import 'package:majoo_test/services/db_helper.dart';
import 'package:majoo_test/ui/auth/AuthScreen.dart';
import 'package:majoo_test/ui/navigation/NavigationScreen.dart';

class VNavigation {
  static toAuth(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AuthScreen()),
            (Route<dynamic> route) => false);
  }

  static toNavigation(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NavigationScreen()),
            (Route<dynamic> route) => false);
  }


}


