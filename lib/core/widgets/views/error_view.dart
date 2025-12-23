import 'package:clara/extensions/context_extension.dart';
import 'package:clara/extensions/widget_extension.dart';
import 'package:clara/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/config/constants/app/app_locale_keys.dart';

class ErrorView extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const ErrorView({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: context.screenHeight * 0.02,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: context.colorScheme.onError,
          ).circleAvatar(
            backgroundColor: context.colorScheme.error,
            radius: 48,
          ),
          if (message.isNotNullOrEmpty)
            Text(
              message!,
              textAlign: TextAlign.center,
              style: context.textStyles.titleMedium,
            ),
          if (onRetry != null)
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(AppLocaleKeys.retry.tr),
            ),
        ],
      ),
    );
  }
}
