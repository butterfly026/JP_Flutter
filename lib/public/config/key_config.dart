import 'package:flutter/material.dart';

class KeyConfig {
  // Protected and public properties
  final String _siteId = 'f036a';
  final String appId = '8';
  final Image launchImage = Image.asset('assets/launch/f036a.png');
  final bool isPushEnabled = false;
  final String screenOrientation = 'unspecified';

  // Getter for siteId with pattern matching
  String get siteId {
    final pattern = RegExp(r'^[a-z]\d{3}[a-e]?');
    final match = pattern.firstMatch(_siteId);
    if (match != null) {
      return match.group(0)!.toLowerCase();
    } else {
      return '';
    }
  }

  // Getter for siteCode with pattern matching
  String get siteCode {
    final pattern = RegExp(r'^([a-z]\d{3}).*?$');
    final match = pattern.firstMatch(_siteId);
    if (match != null) {
      return match.group(1)!.toLowerCase();
    } else {
      return '';
    }
  }

  // Getter for siteName
  String get siteName {
    return '$siteCode${_numberToLetter(frontendId)}';
  }

  // Getter for frontendId with pattern matching
  int get frontendId {
    final pattern = RegExp(r'^[a-z]\d{3}([a-e])?.*?$');
    final match = pattern.firstMatch(_siteId);
    if (match != null) {
      final letter = match.group(1);
      if (letter != null) {
        return letter.codeUnitAt(0) - 96;
      } else {
        return 1;
      }
    } else {
      return 0;
    }
  }

  // Private method to convert number to letter
  String _numberToLetter(int number) {
    if (number >= 1 && number <= 26) {
      // Map 1 to 'a', 2 to 'b', and so on
      return String.fromCharCode('a'.codeUnitAt(0) + number - 1);
    } else {
      // Handle out-of-range numbers or other cases
      return '';
    }
  }
}