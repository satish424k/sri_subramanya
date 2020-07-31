
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FontStyle {
  TextStyle getRegularFontStyle() {
    return TextStyle(
      fontFamily: 'Raleway',
      color: Colors.white
    );
  }

  TextStyle getBoldFontStyle(double size, Color color) {
    return TextStyle(
      fontSize: size,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  TextStyle getTeluguRegularFontStyle(double size, Color color, [double height]) {
    return TextStyle(
      fontSize: size,
      fontFamily: 'SreeKrushnadevaraya',
      fontWeight: FontWeight.w400,
      color: color,
      height: height ?? 1.1
    );
  }
}