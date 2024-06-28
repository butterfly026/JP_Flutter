import 'package:flutter/material.dart';

// class AppColors {
// static const Color primary = Color(0xFF6200EE);
// static const Color primaryVariant = Color(0xFF3700B3);
// static const Color secondary = Color(0xFF03DAC6);
// static const Color secondaryVariant = Color(0xFF018786);
// static const Color background = Color(0xFFFFFFFF);
// static const Color surface = Color(0xFFFFFFFF);
// static const Color error = Color(0xFFB00020);
// static const Color onPrimary = Color(0xFFFFFFFF);
// static const Color onSecondary = Color(0xFF000000);
// static const Color onBackground = Color(0xFF000000);
// static const Color onSurface = Color(0xFF000000);
// static const Color onError = Color(0xFFFFFFFF);
// static const Color bottomNavigationBarColor = Color(0xFF272223);
// }

class AppColors extends ThemeExtension<AppColors> {
  final Color? primary;
  final Color? primaryVariant;
  final Color? secondary;
  final Color? secondaryVariant;
  final Color? background;
  final Color? surface;
  final Color? error;
  final Color? onPrimary;
  final Color? onSecondary;
  final Color? onBackground;
  final Color? onSurface;
  final Color? onError;
  final Color? bottomNavigationBarColor;

  AppColors({
    this.primary = const Color(0xFF6200EE),
    this.primaryVariant = const Color(0xFF3700B3),
    this.secondary = const Color(0xFF03DAC6),
    this.secondaryVariant = const Color(0xFF018786),
    this.background = const Color(0xFFFFFFFF),
    this.surface = const Color(0xFFFFFFFF),
    this.error = const Color(0xFFB00020),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.onSecondary = const Color(0xFF000000),
    this.onBackground = const Color(0xFF000000),
    this.onSurface = const Color(0xFF000000),
    this.onError = const Color(0xFFFFFFFF),
    this.bottomNavigationBarColor = const Color(0xffC5CBC6),
  });

  @override
  AppColors copyWith({
    Color? primary,
    Color? primaryVariant,
    Color? secondary,
    Color? secondaryVariant,
    Color? background,
    Color? surface,
    Color? error,
    Color? onPrimary,
    Color? onSecondary,
    Color? onBackground,
    Color? onSurface,
    Color? onError,
    Color? bottomNavigationBarColor,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondary: secondary ?? this.secondary,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onBackground: onBackground ?? this.onBackground,
      onSurface: onSurface ?? this.onSurface,
      onError: onError ?? this.onError,
      bottomNavigationBarColor:
          bottomNavigationBarColor ?? this.bottomNavigationBarColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: Color.lerp(primary, other.primary, t),
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      secondaryVariant: Color.lerp(secondaryVariant, other.secondaryVariant, t),
      background: Color.lerp(background, other.background, t),
      surface: Color.lerp(surface, other.surface, t),
      error: Color.lerp(error, other.error, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      onSurface: Color.lerp(onSurface, other.onSurface, t),
      onError: Color.lerp(onError, other.onError, t),
      bottomNavigationBarColor: Color.lerp(
          bottomNavigationBarColor, other.bottomNavigationBarColor, t),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppColors &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          primaryVariant == other.primaryVariant &&
          secondary == other.secondary &&
          secondaryVariant == other.secondaryVariant &&
          background == other.background &&
          surface == other.surface &&
          error == other.error &&
          onPrimary == other.onPrimary &&
          onSecondary == other.onSecondary &&
          onBackground == other.onBackground &&
          onSurface == other.onSurface &&
          onError == other.onError &&
          bottomNavigationBarColor == other.bottomNavigationBarColor;

  @override
  int get hashCode =>
      primary.hashCode ^
      primaryVariant.hashCode ^
      primaryVariant.hashCode ^
      secondary.hashCode ^
      secondaryVariant.hashCode ^
      background.hashCode ^
      surface.hashCode ^
      error.hashCode ^
      onPrimary.hashCode ^
      onSecondary.hashCode ^
      onBackground.hashCode ^
      onSurface.hashCode ^
      onError.hashCode ^
      bottomNavigationBarColor.hashCode;
}
