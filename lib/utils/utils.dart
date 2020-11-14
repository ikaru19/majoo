import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majoo_test/utils/v_color.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

class Utils {
  static void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String removeAllSymbols(String string) {
    return string.replaceAll(RegExp(r"[^\s\w]"), '');
  }

  static void toast(message, context,{duration}) {
    Toast.show(
      message,
      context,
      duration: duration ?? Toast.LENGTH_SHORT,
      gravity: Toast.CENTER,
      backgroundColor: VColor.accent,
      textColor: Colors.white,
    );
  }



  static String capitalize(text) {
    if (text == null) return null;
    if (text == "") return "";
    return "${text[0].toUpperCase()}${text.substring(1)}";
  }




  static fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }



  static String dateConvert(
      String input, String formatInput, String formatOutput) {
    try {
      var date = DateFormat(formatInput).parse(input);
      return DateFormat(formatOutput).format(date);
    } catch (e) {
      return "";
    }
  }

  static String getPrettyJSONString(jsonObject) {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }
}
