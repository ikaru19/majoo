import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VPref {


  static setIsLogin(bool login) async {
    var ref = await SharedPreferences.getInstance();
    ref.setBool("isLogin", login);
  }

  static Future<bool> getIsLogin() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getBool("isLogin");
  }

  static setEmail(String email) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("email", email);

  }

  static Future<String> getEmail() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("email");
  }

  static setPhotoUrl(String photo) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("photo", photo);
  }

  static Future<String> getPhotoUrl() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("photo");
  }

  static setName(String name) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("name", name);
  }

  static Future<String> getName() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("name");
  }

  static Future<bool> getIsFirst() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getBool("isFirst");
  }

  static setIsFirst(bool isFirst) async {
    var ref = await SharedPreferences.getInstance();
    ref.setBool("isFirst", isFirst);
  }

  static Future clearAll(context) async {
    var ref = await SharedPreferences.getInstance();
    ref.clear();
    setIsFirst(true);
    return;
  }
}
