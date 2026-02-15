import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/di/module.dart';
import 'package:flutter_winter_firebase/core/router/routes.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/cubit/auth_cubit.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/screens/login_screen.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/screens/register_screen.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/widgets/register_form.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_cubit.dart';
import 'package:flutter_winter_firebase/features/home/presentation/screens/main_screen.dart';
import 'package:flutter_winter_firebase/features/home/presentation/screens/notifications_screen.dart';
import 'package:flutter_winter_firebase/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter_winter_firebase/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider<SplashCubit>(
                create: (context) => sl<SplashCubit>(),
                child: SplashScreen(),
              ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider<AuthCubit>(
                create: (context) => sl<AuthCubit>(),
                child: LoginScreen(),
              ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider<AuthCubit>(
                create: (context) => sl<AuthCubit>(),
                child: RegisterScreen(),
              ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder:
              (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<ProfileCubit>(
                    create: (context) => sl<ProfileCubit>(),
                  ),
                ],
                child: MainScreen(),
              ),
        );
      case Routes.notification:
        return MaterialPageRoute(
          builder: (context) => NotificationsScreen(),
          settings: settings,
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic>? undefinedRoute() {
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(body: Center(child: Text('Undefined route'))),
    );
  }
}
