import 'package:flutter/material.dart';

import 'app_colors.dart';
abstract class AppTheme {
  static final TextStyle largeFontStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static final TextStyle smallFontStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );
  static final TextStyle mediumFontStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}