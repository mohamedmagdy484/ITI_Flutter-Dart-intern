import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 55),
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}
