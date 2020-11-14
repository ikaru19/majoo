import 'package:flutter/material.dart';
import 'package:majoo_test/models/Person.dart';
import 'package:majoo_test/providers/HomeState.dart';
import 'package:majoo_test/services/db_helper.dart';
import 'package:majoo_test/ui/AddPersonScreen.dart';
import 'package:majoo_test/ui/DetailPersonScreen.dart';
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


  static toDetail(context,HomeState state,Person person) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailPersonScreen(person, state)));
  }

  static toAdd(context,HomeState state) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AddPersonScreen(state)));
  }



}


