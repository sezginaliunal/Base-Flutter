import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:test_project/core/components/buttons/elevated_button.dart';
import 'package:test_project/core/config/constants/colors/dark_colors.dart';

class MyDialog {
  static Future<void> errorDialog(String text) async {
    await Get.dialog<dynamic>(
      Builder(
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: context.border.lowBorderRadius,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    color: DarkColors.error,
                    borderRadius: context.border.lowBorderRadius,
                  ),
                ),
                Padding(
                  padding: context.padding.low,
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: DarkColors.error,
                      ),
                      Text('error'.tr, style: context.textTheme.titleLarge),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelLarge,
                      ),
                      Padding(
                        padding: context.padding.onlyTopLow,
                        child: SizedBox(
                          width: double.infinity,
                          child: MyElevatedButton(
                            onPressed: () => Get.back<dynamic>(),
                            child: Text('ok'.tr),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> textDialog(String text) async {
    await Get.dialog<dynamic>(
      Builder(
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: context.border.lowBorderRadius,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    decoration: BoxDecoration(
                      color: DarkColors.primary,
                      borderRadius: context.border.lowBorderRadius,
                    ),
                  ),
                  Padding(
                    padding: context.padding.low,
                    child: Column(
                      children: [
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelLarge,
                        ),
                        Padding(
                          padding: context.padding.onlyTopLow,
                          child: SizedBox(
                            width: Get.width / 2,
                            child: MyElevatedButton(
                              onPressed: () => Get.back<dynamic>(),
                              child: Text('ok'.tr),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> successDialog(String text) async {
    await Get.dialog<dynamic>(
      Builder(
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: context.border.lowBorderRadius,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    color: DarkColors.greenAccent,
                    borderRadius: context.border.lowBorderRadius,
                  ),
                ),
                Padding(
                  padding: context.padding.low,
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 48,
                        color: DarkColors.greenAccent,
                      ),
                      Text('success'.tr, style: context.textTheme.titleLarge),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelLarge,
                      ),
                      Padding(
                        padding: context.padding.onlyTopLow,
                        child: SizedBox(
                          width: double.infinity,
                          child: MyElevatedButton(
                            onPressed: () => Get.back<dynamic>(),
                            child: Text('ok'.tr),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  static Future<bool> confirmDialog(String text) async {
    bool? result = await Get.dialog<bool>(
      Builder(
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: context.border.lowBorderRadius,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    color: DarkColors.primary,
                    borderRadius: context.border.lowBorderRadius,
                  ),
                ),
                Padding(
                  padding: context.padding.low,
                  child: Column(
                    children: [
                      Icon(
                        Icons.help_outline,
                        size: 48,
                        color: DarkColors.primary,
                      ),
                      Text(
                        'are_you_sure'.tr,
                        style: context.textTheme.titleLarge,
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelLarge,
                      ),
                      Padding(
                        padding: context.padding.onlyTopLow,
                        child: Row(
                          children: [
                            Expanded(
                              child: MyElevatedButton(
                                onPressed: () => Get.back(result: true),
                                child: Text('yes'.tr),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: MyElevatedButton(
                                onPressed: () => Get.back(result: false),
                                child: Text('no'.tr),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
    return result ?? false;
  }
}
