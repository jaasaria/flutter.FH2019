import 'package:flutter/material.dart';

// Usage:
// Color color1 = HexColor("b74093");
// Color color2 = HexColor("#b74093");

class ColorHex extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  ColorHex(final String hexColor) : super(_getColorFromHex(hexColor));
}
