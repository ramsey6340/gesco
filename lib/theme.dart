import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16.0,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Noto Sans Symbols',
          fontSize: 16.0,
        ),
      ),
    );
  }
}
