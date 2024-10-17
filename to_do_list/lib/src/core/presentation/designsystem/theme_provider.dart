import 'package:flutter/material.dart';
import 'package:to_do_list/src/core/presentation/designsystem/app_colors.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: green,
    onPrimary: black,
    primaryContainer: green10,
    secondary: white,
    onSecondary: gray,
    tertiary: darkGray,
    onError: darkRed,
    errorContainer: darkRed5,
    surface: gray,
    onSurface: white,
    error: darkRed,
    background: black,
    onBackground: white
    ),
    scaffoldBackgroundColor: black,
  useMaterial3: true
);