import 'package:clara/extensions/context_extension.dart';
import 'package:clara/extensions/widget_extension.dart';
import 'package:clara/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/config/constants/app/app_locale_keys.dart';

class NotFoundView extends StatelessWidget {
  final String? message;
  final VoidCallback? onBack;

  const NotFoundView({super.key, this.message, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: context.screenHeight * 0.02,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64,
            color: context.colorScheme.onSurfaceVariant,
          ).circleAvatar(
            backgroundColor: context.colorScheme.surfaceContainerHighest,
            radius: 48,
          ),
          Text(
            AppLocaleKeys.errNotFound.tr,
            style: context.textStyles.titleMedium,
          ),
          if (message.isNotNullOrEmpty)
            Text(
              message!,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          if (onBack != null)
            ElevatedButton.icon(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back_rounded),
              label: Text(AppLocaleKeys.cancel.tr),
            ),
        ],
      ),
    );
  }
}
