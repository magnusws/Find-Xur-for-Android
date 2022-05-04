import 'package:flutter/material.dart';

// This file is adapted from
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/gallery/themes.dart

final kLightTheme = _buildLightTheme();
final kDarkTheme = _buildDarkTheme();
final kXurTheme = _buildXurTheme();

ThemeData _buildLightTheme() {
  final Color primaryColor = Colors.amber[300];
  final Color secondaryColor = Colors.amber[300];
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: Colors.amber[300],
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = Colors.white;
  const Color secondaryColor = Colors.grey;
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorDark: Colors.amber[300],
    primaryColorLight: secondaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: Colors.amber[300],
    accentColor: Colors.amber[300],
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    backgroundColor: const Color(0xFF202124),
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}

ThemeData _buildXurTheme() {
final ThemeData xurTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    accentColor: Color.fromRGBO( 200, 164, 6, 1.0),
    canvasColor: Colors.black,

    // Define the default font family.
    fontFamily: 'Product Sans',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 76, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 2, height: 1.1),
      headline2: TextStyle(fontSize: 42, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1.2, height: 1.1),
      headline3: TextStyle(fontSize: 48, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Roboto',),
      headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, letterSpacing: 4, height: 1.1),
      headline6: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 0.1),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.white70, fontFamily: 'Roboto'),
      bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white70, letterSpacing: 0.2),
      caption: TextStyle(fontSize: 10.0, color: Colors.grey, fontWeight: FontWeight.w700, letterSpacing: 1.6,),
    ),
  );
  return xurTheme.copyWith(
    textTheme: xurTheme.textTheme,
    primaryTextTheme: xurTheme.primaryTextTheme,
    accentTextTheme: xurTheme.accentTextTheme,
  );
}