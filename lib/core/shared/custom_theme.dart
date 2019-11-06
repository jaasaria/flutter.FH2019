import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColors.primaryColorLight,
    accentColor: Colors.black,
    backgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.white,
    backgroundColor: Colors.grey[900],
  );
}
