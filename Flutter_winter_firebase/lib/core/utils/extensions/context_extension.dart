import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/core/utils/enums/snackbar_type.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.info,
    String? action,
    VoidCallback? onPressed,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        action:
            action != null
                ? SnackBarAction(
                  label: action,
                  textColor: type.textColor(),
                  onPressed: onPressed!,
                )
                : null,
        backgroundColor: type.bgColor(),
        content: Text(message, style: TextStyle(color: type.textColor())),
      ),
    );
  }

  void showAppDialog({
    required String title,
    required Widget content,
    IconData? icon,
    VoidCallback? onCancelPressed,
    VoidCallback? onOkPressed,
  }) {
    showDialog(
      context: this,
      builder:
          (context) => AlertDialog(
            title: Row(
              children: [
                Icon(icon),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: content,
          ),
    );
  }

  void navigateTo(String page, {String? arg}) {
    debugPrint(arg);
    Navigator.pushNamed(this, page, arguments: arg);
  }

  void navigateReplacement(String page) {
    Navigator.pushReplacementNamed(this, page);
  }
}
