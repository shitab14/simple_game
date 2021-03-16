import 'package:flutter/material.dart';

class ShitabsThemeMaker {
  static ThemeData getSwipeToMatchNumberTheme() {
    return ThemeData(
      primarySwatch: Colors.amber,
      primaryColor: Colors.amber,
      primaryColorLight: Colors.yellowAccent,
      primaryColorDark: Colors.yellow,
      accentColor: Colors.amberAccent,
    );
  }

  static TextStyle getButtonTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 12.0
    );
  }

  static TextStyle getAppBarTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 18.0
    );
  }
}