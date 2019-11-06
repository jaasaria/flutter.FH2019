import 'package:flutter/material.dart';

class CustomBoxDecoration {
  static BoxDecoration avatarWhite = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width: 3, color: Colors.white));

  static BoxDecoration avatarGrey = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width: 3, color: Colors.grey[300]));

//--------------
// You May Apply
//--------------

// CircleBorder()
// shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),

}
