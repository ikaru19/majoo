import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  String symbol;

  CurrencyInputFormatter({String symbol}) {
    this.symbol = symbol;
  }

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    int value = int.parse(newValue.text);
    final formatter = NumberFormat('#,##0', 'in_ID');
    String newText = formatter.format(value);
    if (symbol != null) {
      newText = '$symbol $newText';
    }

    return newValue.copyWith(
      text: newText,
      selection: new TextSelection.collapsed(offset: newText.length),
    );
  }
}
