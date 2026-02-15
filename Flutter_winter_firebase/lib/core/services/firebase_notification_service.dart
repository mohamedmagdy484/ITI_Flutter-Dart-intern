import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_winter_firebase/core/router/routes.dart';
import 'package:flutter_winter_firebase/core/utils/extensions/context_extension.dart';
import 'package:flutter_winter_firebase/my_app.dart';

class FirebaseNotificationService {
  FirebaseNotificationService._();

  static final FirebaseNotificationService instance =
  FirebaseNotificationService._();

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      //register token to server
      debugPrint(token);
    }
    _firebaseMessaging.onTokenRefresh.listen((refreshToken) {
      //register token to server
      debugPrint(refreshToken);
    });
    await checkPermission();
  }

  Future<void> checkPermission() async {
    NotificationSettings settings =
    await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  void handleForegroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      showNotification(remoteMessage);
      NotificationData.remoteMessage = remoteMessage;
      debugPrint(remoteMessage.notification?.title);
      debugPrint(remoteMessage.notification?.body);
      if (remoteMessage.data.isNotEmpty) {
        debugPrint(remoteMessage.data.toString()); //Map<String, dynamic>
        debugPrint(remoteMessage.data['data']);
      }
    });
  }

  void handleOnMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      showNotification(remoteMessage);
      debugPrint(remoteMessage.data['data']);
      if (remoteMessage.data.isNotEmpty) {
        debugPrint(remoteMessage.data.toString()); //Map<String, dynamic>
        debugPrint(remoteMessage.data['data']);
      }
      NotificationData.remoteMessage = remoteMessage;
    });
  }

  void handleOnAppTerminated() {
    FirebaseMessaging.instance.getInitialMessage().then((
        RemoteMessage? remoteMessage,
        ) {
      if (remoteMessage != null) {
        showNotification(remoteMessage);
        NotificationData.remoteMessage = remoteMessage;
        navigate(remoteMessage.data['data']);
        debugPrint(remoteMessage.notification?.title);
        debugPrint(remoteMessage.notification?.body);
        if (remoteMessage.data.isNotEmpty) {
          debugPrint(remoteMessage.data.toString()); //Map<String, dynamic>
          debugPrint(remoteMessage.data['data']);
        }
      }
    });
  }

  void handleBackgroundNotification() {
    FirebaseMessaging.onBackgroundMessage(_backgroundNotificationHandler);
  }

  void showNotification(RemoteMessage remoteMessage) {
    AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('app_icon');
    DarwinInitializationSettings iosInitializationSettings =
    DarwinInitializationSettings();
    InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'winter_app_id',
      'winter_app_name',
      importance: Importance.high,
      enableLights: true,
      enableVibration: true,
    );

    DarwinNotificationDetails iosNotificationDetails =
    DarwinNotificationDetails(presentSound: true, presentAlert: true);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

  }
}

@pragma("vm:entry-point")
Future<void> _backgroundNotificationHandler(RemoteMessage remoteMessage) async {
  FirebaseNotificationService.instance.showNotification(remoteMessage);
  debugPrint(remoteMessage.data['data']);
  NotificationData.remoteMessage = remoteMessage;
  debugPrint(remoteMessage.notification?.title);
  debugPrint(remoteMessage.notification?.body);
  if (remoteMessage.data.isNotEmpty) {
    debugPrint(remoteMessage.data.toString()); //Map<String, dynamic>
    debugPrint(remoteMessage.data['data']);
  }
}

void _onDidBackgroundNotificationTap(NotificationResponse details) {
  debugPrint(NotificationData.remoteMessage?.data.toString());
  if (NotificationData.remoteMessage != null) {
    navigate(NotificationData.remoteMessage?.data['data']!);
  }
  debugPrint(details.data.toString());
  debugPrint(details.payload);
}

void navigate(String value) {
  debugPrint('navigate with $value');
  BuildContext? context = navigatorKey.currentContext;
  if (context != null && context.mounted) {
    context.navigateTo(Routes.notification, arg: value);
  }
}

class NotificationData {
  static RemoteMessage? remoteMessage;
}
