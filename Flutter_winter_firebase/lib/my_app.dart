import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/core/router/app_router.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
