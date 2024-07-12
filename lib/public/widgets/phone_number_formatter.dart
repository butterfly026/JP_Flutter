import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (cleanedText.length >= 4 && cleanedText.length <= 7) {
      cleanedText =
          '${cleanedText.substring(0, 3)} ${cleanedText.substring(3)}';
    } else if (cleanedText.length >= 8) {
      cleanedText =
          '${cleanedText.substring(0, 3)} ${cleanedText.substring(3, 7)} ${cleanedText.substring(7)}';
    }

    if (cleanedText.length > 13) {
      cleanedText = cleanedText.substring(0, 13);
    }

    final newText = TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );

    return newText;
  }
}
