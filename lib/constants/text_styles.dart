import 'package:flutter/material.dart';
import 'package:nasari_flutter/constants/color_palette.dart';

class FontWeightEnum {
  FontWeightEnum._();

  /// w300
  static const FontWeight light = FontWeight.w300;

  /// w400
  static const FontWeight regular = FontWeight.w400;

  /// w500
  static const FontWeight medium = FontWeight.w500;

  /// w600
  static const FontWeight semiBold = FontWeight.w600;

  /// w800
  static const FontWeight bold = FontWeight.w800;
}

class FontTextStyle {
  static const TextStyle primaryTextStyle =
      TextStyle(color: ColorPalette.primary);
  static const TextStyle whiteTextStyle = TextStyle(color: Colors.white);
  static const TextStyle blackTextStyle = TextStyle(color: Colors.black);
}
