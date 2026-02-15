import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/common_widgets/app_rich_text.dart';
import 'package:flutter_winter_firebase/core/di/module.dart';
import 'package:flutter_winter_firebase/core/resources/app_colors.dart';
import 'package:flutter_winter_firebase/core/resources/app_text_styles.dart';
import 'package:flutter_winter_firebase/core/router/routes.dart';
import 'package:flutter_winter_firebase/core/utils/extensions/context_extension.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/cubit/auth_cubit.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('''Welcome 
Back!''', style: AppTextStyles.blackColor24ExtraBold),
              SizedBox(height: 30),
              LoginForm(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 50),
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () => context.navigateTo(Routes.register),
                    child: AppRichText(
                      originalText: 'Don\'t hava an account? ',
                      highlightedText: 'Create an account',
                      originalTextStyle: AppTextStyles.pinkF8Color12Regular
                          .copyWith(color: AppColors.darkGreyColor),
                      highlightedTextStyle: AppTextStyles.grey67Color12Medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
