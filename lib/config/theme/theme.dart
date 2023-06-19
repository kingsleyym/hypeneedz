import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Color.fromRGBO(248, 248, 248, 1);
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Color.fromARGB(255, 0, 0, 0);
  static const Color _appbarColorLight = Colors.blue;
  static final Color _lightSecondaryColor = Color.fromARGB(255, 0, 0, 0);

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;
  static final Color _darkSecondaryColor = Colors.blueGrey.shade50;

  static const Color _iconColor = Colors.white;

  static const Color _accentColorDark = Color.fromRGBO(74, 217, 217, 1);
  static Color gradientColorA = const Color(0xFFFFFFFF);
  static Color gradientColorB = const Color(0xFF000000);

  ThemeData getTheme(String themeName) {
    if (themeName == 'darkTheme') {
      gradientColorA = const Color(0xFFFFFFFF);
      gradientColorB = const Color(0xFF000000);
      return darkTheme;
    } else if (themeName == 'lightTheme') {
      gradientColorA = const Color(0xFF000000);
      gradientColorB = const Color(0xFFFFFFFF);
      return lightTheme;
    } else {
      return lightTheme;
    }
  }

  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Gilroy",
    fontSize: 20,
  );

  static const TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary, fontFamily: "Roboto", fontSize: 16);

  static final TextTheme _lightTextTheme = TextTheme(
      headline1:
          _lightHeadingText.copyWith(fontSize: 26, fontWeight: FontWeight.w400),
      headline2:
          _lightHeadingText.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
      headline3: _lightHeadingText.copyWith(fontSize: 22),
      headline4: _lightHeadingText.copyWith(fontSize: 20),
      headline5: _lightHeadingText.copyWith(fontSize: 18),
      headline6: _lightHeadingText.copyWith(fontSize: 16),
      bodyText1: _lightBodyText,
      bodyText2: _lightBodyText);

  static const TextStyle _darkThemeHeadingTextStyle = TextStyle(
    color: _darkTextColorPrimary,
    fontFamily: "Gilroy",
    fontSize: 20,
  );

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkThemeHeadingTextStyle.copyWith(
        fontSize: 36, fontWeight: FontWeight.w100),
    headline2: _darkThemeHeadingTextStyle.copyWith(fontSize: 20),
    headline3: _darkThemeHeadingTextStyle.copyWith(fontSize: 22),
    headline4: _darkThemeHeadingTextStyle.copyWith(fontSize: 20),
    headline5: _darkThemeHeadingTextStyle.copyWith(fontSize: 18),
    headline6: _darkThemeHeadingTextStyle.copyWith(fontSize: 16),
    bodyText1: _darkThemeBodyeTextStyle,
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: _lightPrimaryVariantColor),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: _lightPrimaryVariantColor)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)));

  static final InputDecorationTheme _darkinputDecorationTheme =
      InputDecorationTheme(
          floatingLabelStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)));

  static final ThemeData lightTheme = ThemeData(
      inputDecorationTheme: _inputDecorationTheme,
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorLight,
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          onPrimary: _lightOnPrimaryColor,
          secondary: _lightSecondaryColor,
          tertiary: Color.fromARGB(255, 251, 109, 0),
          primaryContainer: _lightPrimaryVariantColor),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      inputDecorationTheme: _darkinputDecorationTheme,
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark,
          iconTheme: const IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorDark,
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        tertiary: Color.fromARGB(255, 251, 109, 0),
        onPrimary: _darkOnPrimaryColor,
        primaryContainer: _darkPrimaryVariantColor,
      ),
      textTheme: _darkTextTheme);
}
