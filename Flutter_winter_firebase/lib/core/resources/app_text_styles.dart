import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Montserrat';

  static const TextStyle blackColor18SemiBold = TextStyle(
    color: AppColors.darkGreyColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle blackColor24ExtraBold = TextStyle(
    color: AppColors.darkGreyColor,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle grey14SemiBold = TextStyle(
    color: AppColors.greyA8Color,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle grey67Color12Medium = TextStyle(
    color: AppColors.darkGreyColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle pinkF8Color12Regular = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle whiteColor16SemiBold = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
