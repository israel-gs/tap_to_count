import 'package:flutter/material.dart';
import 'package:tap_to_count/core/theme/colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Satoshi',
  primarySwatch: customMaterialColor,
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black87,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: customMaterialColor[500],
      onPrimary: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: secondaryLightBackgroundColor,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        width: 1,
        color: secondaryLightBackgroundColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: secondaryLightBackgroundColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: secondaryLightBackgroundColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    labelStyle: const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
  ),
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    labelSmall: TextStyle(
      color: Colors.black87,
      fontSize: 14,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Satoshi',
  primarySwatch: customMaterialColor,
  scaffoldBackgroundColor: darkBackgroundColor,
  drawerTheme: const DrawerThemeData(
    backgroundColor: darkBackgroundColor,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: darkBackgroundColor,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: customMaterialColor[500],
      onPrimary: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: secondaryDarkBackgroundColor,
    filled: true,
    hintStyle: const TextStyle(
      color: Colors.white60,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        width: 1,
        color: secondaryDarkBackgroundColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFF39434F),
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: secondaryDarkBackgroundColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    labelStyle: const TextStyle(
      color: Colors.white38,
      fontSize: 16,
    ),
  ),
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    labelSmall: TextStyle(
      color: Colors.white60,
      fontSize: 14,
    ),
  ),
);
