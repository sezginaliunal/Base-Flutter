class Validators {
  static String? validateEmail(String? input) {
    final value = input?.trim();
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    const emailRegex = r'^[^@]+@[^@]+\.[^@]+';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? input) {
    final value = input?.trim();
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validateNull(String? input) {
    final value = input?.trim();
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }

    return null;
  }
}
