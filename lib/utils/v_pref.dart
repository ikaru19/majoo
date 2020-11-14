import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xenditkeyboard/models/auth/login/login_response.dart';
import 'package:xenditkeyboard/models/auth/register/register_response.dart';
import 'package:xenditkeyboard/models/profile/profile.dart';
import 'package:xenditkeyboard/providers/profile/profile_state.dart';
import 'package:xenditkeyboard/providers/store/store_state.dart';
import 'package:xenditkeyboard/providers/transaksi/create_transaction_state.dart';

class VPref {
  static saveRegisToken(RegisterResponse data) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("regisToken", data.data.token);
  }

  static Future<String> getRegisToken() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("regisToken");
  }

  static Future<Map<String, String>> getHeaderRegisToken() async {
    var ref = await SharedPreferences.getInstance();
    return {"Authorization": "Bearer ${ref.getString("regisToken")}"};
  }

  static saveToken(LoginResponse data) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("token", data.data.token);
  }

  static Future<String> getToken() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("token");
  }

  static saveFirebaseToken(String token) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("firebase_token", token);
  }

  static Future<String> getFirebaseToken() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("firebase_token");
  }

  static Future<Map<String, String>> getHeader() async {
    var ref = await SharedPreferences.getInstance();
    return {"Authorization": "Bearer ${ref.getString("token")}"};
  }

  static savePhone(String data) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("phone", data);
  }

  static Future<String> getPhone() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("phone");
  }

  static saveProfile(Profile data) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString("profile", jsonEncode(data));
  }

  static Future<Profile> getProfile() async {
    var ref = await SharedPreferences.getInstance();
    if (ref.getString("profile") == null) return null;
    return Profile.fromJsonMap(jsonDecode(ref.getString("profile")));
  }

  static Future<bool> getIsCash() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getBool("isCash");
  }

  static setIsCash(bool isCash) async {
    var ref = await SharedPreferences.getInstance();
    ref.setBool("isCash", isCash);
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
    Provider.of<CreateTransactionState>(context, listen: false).clearAll();
    Provider.of<StoreState>(context, listen: false).clearAll();
    Provider.of<ProfileState>(context, listen: false).clearAll();

    setIsFirst(false);
    return;
  }
}
