import 'package:flutter/material.dart';

import 'custom_sizes.dart';

class CustomTextStyle {
  // Weight:
  // 400 - Normal
  // 500 - Medium
  // 600 - Semi Bold
  // 700 - Bold

  static const body1 = TextStyle(fontSize: CustomSizes.body);

  static const body2 =
      TextStyle(fontSize: CustomSizes.body, fontWeight: FontWeight.w500);

  static const headerFade = TextStyle(fontSize: 16.0);
  static const footer = TextStyle(fontSize: 10.0);
}
