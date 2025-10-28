import 'package:test_project/core/extensions/string_extension.dart';

class Validators {
  // =================== Email ===================
  static String? validateEmail(String? input) {
    if (input.isNullOrEmpty) {
      return 'Email is required';
    }
    if (!(input?.isEmail ?? false)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // =================== Password ===================
  static String? validatePassword(String? input, {int minLength = 8}) {
    if (input.isNullOrEmpty) {
      return 'Password is required';
    }
    if ((input?.trim().length ?? 0) < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  // =================== Null / Required ===================
  static String? validateNull(String? input) {
    if (input.isNullOrEmpty) {
      return 'Field is required';
    }
    return null;
  }

  // =================== Optional: Numeric ===================
  static String? validateNumeric(String? input) {
    if (input.isNullOrEmpty) {
      return 'Field is required';
    }
    if (!(input?.isNumeric ?? false)) {
      return 'Enter a valid number';
    }
    return null;
  }

  // =================== Optional: Phone Number ===================
  static String? validatePhoneNumber(String? input) {
    if (input.isNullOrEmpty) {
      return 'Phone number is required';
    }
    if (!(input?.isPhoneNumber ?? false)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
