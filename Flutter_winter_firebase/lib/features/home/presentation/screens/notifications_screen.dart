import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/core/resources/app_text_styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments == null) {
      return Scaffold(
        body: Center(
          child: Text('No data', style: AppTextStyles.blackColor24ExtraBold),
        ),
      );
    } else {
      String data = ModalRoute.of(context)!.settings.arguments as String;
      return Scaffold(
        body: Center(
          child: Text(data, style: AppTextStyles.blackColor24ExtraBold),
        ),
      );
    }
  }
}
