import 'package:get/get.dart';
import 'package:test_project/core/config/constants/app/app_locale_keys.dart';
import 'package:clara/extensions/string_extension.dart';

class Validators {
  // =================== Email ===================
  static String? validateEmail(String? input) {
    if (input.isNullOrEmpty) {
      return AppLocaleKeys.valEmailRequired.tr;
    }
    if (!(input?.isEmail ?? false)) {
      return AppLocaleKeys.valInvalidEmail.tr;
    }
    return null;
  }

  // =================== Password ===================
  static String? validatePassword(String? input, {int minLength = 8}) {
    if (input.isNullOrEmpty) {
      return AppLocaleKeys.valPasswordRequired.tr;
    }
    if ((input?.trim().length ?? 0) < minLength) {
      return AppLocaleKeys.valPasswordMinLength.trParams({
        'count': minLength.toString(),
      });
    }
    return null;
  }

  // =================== Null / Required ===================

  static String? validateNull(String? input) {
    if (input.isNullOrEmpty) {
      return AppLocaleKeys.valFieldRequired.tr;
    }
    return null;
  }

  // =================== Numeric ===================
  static String? validateNumeric(String? input) {
    if (input.isNullOrEmpty) {
      return AppLocaleKeys.valFieldRequired.tr;
    }
    if (!(input?.isNumeric ?? false)) {
      return AppLocaleKeys.valInvalidNumber.tr;
    }
    return null;
  }

  // =================== Phone Number ===================
  static String? validatePhoneNumber(String? input) {
    if (input.isNullOrEmpty) {
      return AppLocaleKeys.valPhoneRequired.tr;
    }
    if (!(input?.isPhoneNumber ?? false)) {
      return AppLocaleKeys.valInvalidPhone.tr;
    }
    return null;
  }

  // =================== Http / URL ===================
  static String? validateHttp(String? input) {
    final nullError = validateNull(input);
    if (nullError != null) return nullError;

    if (!(input!.startsWith('http://') || input.startsWith('https://'))) {
      return AppLocaleKeys.valInvalidUrl.tr;
    }

    return null;
  }
}
