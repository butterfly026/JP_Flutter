import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  static const Color mainDark = Color(0xFF333333);
  static const Color mainGrey = Color(0xFF9E9EAE);
  static const Color mainLightGrey = Color(0xFFE3E3E8);
  static const Color mainGhostWhite = Color(0xFFF5F5F7);
  static const Color success = Color(0xFF8BC34A);
  static const Color info = Color(0xFF2296F3);
  static const Color error = Color(0xFFE57373);
  static const Color warning = Color(0xFFFDD735);
  static const Color primary = Color(0xFF1A76D2);
  static const Color secondary = Color(0xFF6C757D);
  static const Color button = Color(0xFFFFA800);

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'OpenSans';
  static const Color black = Color(0xFF000000);
  static const Color defaultColor = Color.fromRGBO(136, 136, 136, 1.0);
  static const Color label = Color.fromRGBO(254, 36, 114, 1.0);
  static const Color neutral = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color tabs = Color.fromRGBO(222, 222, 222, 0.3);
  static const Color text = Color.fromRGBO(44, 44, 44, 1.0);
  static const Color bgColorScreen = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color border = Color.fromRGBO(231, 231, 231, 1.0);
  static const Color inputSuccess = Color.fromRGBO(27, 230, 17, 1.0);
  static const Color input = Color.fromRGBO(220, 220, 220, 1.0);
  static const Color inputError = Color.fromRGBO(255, 54, 54, 1.0);
  static const Color muted = Color.fromRGBO(136, 152, 170, 1.0);
  static const Color time = Color.fromRGBO(154, 154, 154, 1.0);
  static const Color priceColor = Color.fromRGBO(234, 213, 251, 1.0);
  static const Color active = Color.fromRGBO(249, 99, 50, 1.0);
  static const Color buttonColor = Color.fromRGBO(156, 38, 176, 1.0);
  static const Color placeholder = Color.fromRGBO(159, 165, 170, 1.0);
  static const Color switchON = Color.fromRGBO(249, 99, 50, 1.0);
  static const Color switchOFF = Color.fromRGBO(137, 137, 137, 1.0);
  static const Color gradientStart = Color.fromRGBO(107, 36, 170, 1.0);
  static const Color gradientEnd = Color.fromRGBO(172, 38, 136, 1.0);
  static const Color socialFacebook = Color.fromRGBO(59, 89, 152, 1.0);
  static const Color socialTwitter = Color.fromRGBO(91, 192, 222, 1.0);
  static const Color socialDribbble = Color.fromRGBO(234, 76, 137, 1.0);

  static const margin = 16.0;
  // static const TextTheme textTheme = TextTheme(
  //   headline4: display1,
  //   headline5: headline,
  //   headline6: title,
  //   subtitle2: subtitle,
  //   bodyText2: body2,
  //   bodyText1: body1,
  //   caption: caption,
  // );
  static const TextTheme textTheme = TextTheme(
    headlineLarge: display1,
    headlineMedium: headline,
    headlineSmall: title,
    labelSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.27,
    color: mainDark,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    letterSpacing: -0.04,
    color: mainDark,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w200,
    fontSize: 14,
    letterSpacing: 0.2,
    color: mainDark,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    extensions: <ThemeExtension<dynamic>>[
      AppColors(),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    extensions: <ThemeExtension<dynamic>>[
      AppColors(),
    ],
  );
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  AppTheme() {
    final prefs = SharedPreferences.getInstance();
    prefs.then((storage) {
      final value = storage.get('themeMode');

      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeMode = ThemeMode.light;
        notifyListeners();
      } else {
        _themeMode = ThemeMode.dark;
        notifyListeners();
      }
    });
  }

  void toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    if (_themeMode == ThemeMode.light) {
      prefs.setString('themeMode', 'light');
    } else {
      prefs.setString('themeMode', 'dark');
    }
    notifyListeners();
  }
}
