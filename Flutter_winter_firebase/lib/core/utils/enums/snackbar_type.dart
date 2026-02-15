import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  error,
  info,
  warning;

  Color textColor() {
    switch (this) {
      case SnackBarType.warning:
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  Color bgColor() {
    switch (this) {
      case SnackBarType.warning:
        return Colors.orange[200]!;
      case SnackBarType.error:
        return Colors.red[200]!;
      case SnackBarType.info:
        return Colors.blue[200]!;
      case SnackBarType.success:
        return Colors.green[200]!;
    }
  }
}
