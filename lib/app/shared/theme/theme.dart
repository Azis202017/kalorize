import 'package:flutter/material.dart';
import 'package:kalorize/app/shared/theme/font.dart';

import 'color.dart';

ThemeData themeData = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    filled: true,
    fillColor: inputColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        100,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        100,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: error),
      borderRadius: BorderRadius.circular(
        100,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: error),
      borderRadius: BorderRadius.circular(
        100,
      ),
    ),
    hintStyle: body2Regular,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 10,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      side: const BorderSide(
        width: 1,
        style: BorderStyle.solid,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: primaryColor,
  ),
);
