import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? primary;
  final Color? red;
  final Color? yellow;
  final Color? blue;
  final Color? grey;
  final Color? lightGrey;
  final Color? darkGrey;
  final Color? backgroundColor;
  final Color? colorCard;

  const AppColors({
    required this.primary,
    required this.red,
    required this.yellow,
    required this.blue,
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
    Color? yellow,
    Color? blue,
    Color? grey,
    Color? lightGrey,
    Color? darkGrey,
    Color? backgroundColor,
    Color? colorCard,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      red: red ?? this.red,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
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
      yellow: Color.lerp(yellow, other.yellow, t),
      blue: Color.lerp(blue, other.blue, t),
      grey: Color.lerp(grey, other.grey, t),
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t),
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      colorCard: Color.lerp(colorCard, other.colorCard, t),
    );
  }
}
