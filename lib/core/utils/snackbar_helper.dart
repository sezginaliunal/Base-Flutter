import 'package:flutter/material.dart';

/// Helper class for showing snackbars
class SnackbarHelper {
  /// Show a success snackbar
  static void showSuccessSnackbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.green,
      duration: duration,
    );
  }

  /// Show an error snackbar
  static void showErrorSnackbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.red,
      duration: duration,
    );
  }

  /// Show a warning snackbar
  static void showWarningSnackbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.orange,
      duration: duration,
    );
  }

  /// Show an info snackbar
  static void showInfoSnackbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.blue,
      duration: duration,
    );
  }

  /// Show a custom snackbar
  static void _showSnackbar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  /// Hide the current snackbar
  static void hideSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
