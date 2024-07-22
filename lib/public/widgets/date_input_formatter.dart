import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle backspace
    final RegExp regExp = RegExp(r'^(\d{0,4})\/?(\d{0,2})\/?(\d{0,2})');
    String formatted = '';

    if (!regExp.hasMatch(newValue.text)) {
      return oldValue;
    }

    for (var rune in newValue.text.runes) {
      if (rune >= 48 && rune <= 57) {
        formatted += String.fromCharCode(rune);
      }
    }

    // Handle the case when the last character is a backslash
    formatted = formatted.replaceAllMapped(RegExp(r'(\d{4})(\d{2})(\d{2})'), (Match m) => "${m[1]}/${m[2]}/${m[3]}");

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
