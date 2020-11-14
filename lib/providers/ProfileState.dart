import 'package:flutter/material.dart';
import 'package:majoo_test/services/db_helper.dart';
import 'package:majoo_test/utils/v_navigation.dart';
import 'package:majoo_test/utils/v_pref.dart';

class ProfileState extends ChangeNotifier {
  String name;
  String email;
  String profileUrl;
  BuildContext context;
  DbHelper dbHelper = DbHelper();

  ProfileState(this.context) {
    _init();
  }

  _init() async {
    this.name = await VPref.getName();
    this.email = await VPref.getEmail();
    this.profileUrl = await VPref.getPhotoUrl();
    notifyListeners();
  }

  logout() async {

    await VPref.clearAll(context);
    await dbHelper.deleteDb();
    VNavigation.toAuth(context);
  }
}
