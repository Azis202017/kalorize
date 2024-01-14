import 'package:flutter/material.dart';
import 'package:kalorize/app/shared/theme/font.dart';

import 'color.dart';

ThemeData themeData = ThemeData(
  useMaterial3: false,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      disabledBackgroundColor: neutralDisable,
      disabledForegroundColor: neutralLight,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
      ),
      disabledForegroundColor: neutralSecondary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      foregroundColor: neutralSecondary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    filled: true,
    fillColor: neutralForm,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: errorPrimary),
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: errorPrimary),
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    hintStyle: pharagraph,
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
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: mainPrimary,
  ),
);
