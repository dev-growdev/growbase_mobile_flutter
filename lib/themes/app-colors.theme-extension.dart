import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? primary;
  final Color? red;
  final Color? white;
  final Color? lightBlue;
  final Color? darkBlue;
  final Color? grey;
  final Color? lightGrey;
  final Color? darkGrey;
  final Color? backgroundColor;
  final Color? colorCard;

  const AppColors({
    required this.primary,
    required this.red,
    required this.white,
    required this.lightBlue,
    required this.darkBlue,
    required this.grey,
    required this.lightGrey,
    required this.darkGrey,
    required this.backgroundColor,
    required this.colorCard,
  });

  @override
  AppColors copyWith({
    Color? primary,
    Color? red,
    Color? white,
    Color? lightBlue,
    Color? darkBlue,
    Color? grey,
    Color? lightGrey,
    Color? darkGrey,
    Color? backgroundColor,
    Color? colorCard,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      red: red ?? this.red,
      white: white ?? this.white,
      lightBlue: lightBlue ?? this.lightBlue,
      darkBlue: darkBlue ?? this.darkBlue,
      grey: grey ?? this.grey,
      lightGrey: lightGrey ?? this.lightGrey,
      darkGrey: darkGrey ?? this.darkGrey,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      colorCard: colorCard ?? this.colorCard,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: Color.lerp(primary, other.primary, t),
      red: Color.lerp(red, other.red, t),
      white: Color.lerp(white, other.white, t),
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t),
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t),
      grey: Color.lerp(grey, other.grey, t),
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t),
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      colorCard: Color.lerp(colorCard, other.colorCard, t),
    );
  }
}
