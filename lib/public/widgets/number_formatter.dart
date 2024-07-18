import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  final int length;
  NumberFormatter({this.length = 255});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (cleanedText.length > length) {
      cleanedText = cleanedText.substring(0, length);
    }

    final newText = TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );

    return newText;
  }
}
