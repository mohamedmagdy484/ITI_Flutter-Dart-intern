import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/common_state/screen_state.dart';
import 'package:flutter_winter_firebase/core/resources/app_colors.dart';
import 'package:flutter_winter_firebase/core/router/routes.dart';
import 'package:flutter_winter_firebase/core/utils/extensions/context_extension.dart';
import 'package:flutter_winter_firebase/features/splash/presentation/cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, ScreenState>(
      listener: (context, state) {
        if (state == ScreenState.login) {
          context.navigateReplacement(Routes.login);
        } else if (state == ScreenState.home) {
          context.navigateReplacement(Routes.home);
        }
      },
      child: Scaffold(backgroundColor: AppColors.primaryColor),
    );
  }

  void _init() {
    context.read<SplashCubit>().navigateToPage();
  }
}
