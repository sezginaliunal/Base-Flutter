import 'package:clara/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/config/constants/app/app_keys.dart';

/// App genelinde context kullanmadan UI bileşenleri göstermek için yardımcı sınıf.
/// Snackbar, Dialog, BottomSheet, DatePicker, TimePicker hepsi tek yerden yönetilir.
class AppUI {
  AppUI._();

  static BuildContext? get _context => AppKeys().context;

  // ===================== SNACKBAR =====================
  static void showSnack(
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    final ctx = _context;
    if (ctx == null) return;

    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ctx.lowRadiusValue),
        ),
        animation: CurvedAnimation(
          parent: kAlwaysCompleteAnimation, // or custom AnimationController
          curve: Curves.slowMiddle, // daha yumuşak geçiş
        ),
      ),
    );
  }

  // ===================== DIALOG =====================
  static Future<void> showDialogBox({
    required String title,
    required String message,
    String confirmText = "Tamam",
    VoidCallback? onConfirm,
  }) async {
    final ctx = _context;
    if (ctx == null) return;

    await showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ctx.lowRadiusValue),
        ),
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  // ===================== BOTTOM SHEET =====================
  static Future<T?> showBottomSheet<T>({required Widget child}) async {
    final ctx = _context;
    if (ctx == null) return null;

    return showModalBottomSheet<T>(
      context: ctx,
      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ctx.lowRadiusValue),
        ),
      ),
      builder: (_) => child,
    );
  }

  // ===================== DATE PICKER =====================
  static Future<DateTime?> pickDate({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final ctx = _context;
    if (ctx == null) return null;

    final now = DateTime.now();
    return await showDatePicker(
      context: ctx,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(now.year - 5),
      lastDate: lastDate ?? DateTime(now.year + 5),
    );
  }

  // ===================== TIME PICKER =====================
  static Future<TimeOfDay?> pickTime({TimeOfDay? initialTime}) async {
    final ctx = _context;
    if (ctx == null) return null;

    return await showTimePicker(
      context: ctx,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
  }
}
