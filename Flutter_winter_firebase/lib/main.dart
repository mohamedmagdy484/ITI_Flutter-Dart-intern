import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/core/di/module.dart';
import 'package:flutter_winter_firebase/core/services/firebase_notification_service.dart';
import 'package:flutter_winter_firebase/firebase_options.dart';
import 'package:flutter_winter_firebase/my_app.dart';
 import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    debugPrint("Firebase already initialized: $e");
  }
  // ---------------------

  await FirebaseNotificationService.instance.init();
  FirebaseNotificationService.instance.handleForegroundNotification();
  FirebaseNotificationService.instance.handleOnMessageOpenedApp();
  FirebaseNotificationService.instance.handleOnAppTerminated();
  FirebaseNotificationService.instance.handleBackgroundNotification();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}