/// Global application strings
/// Note: In production, these should be loaded from localization files
class AppStrings {
  // Common
  static const String appName = 'BaseFlutter';
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String loading = 'Loading';
  static const String retry = 'Retry';

  // Auth
  static const String login = 'Login';
  static const String logout = 'Logout';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String signUp = 'Sign Up';

  // Validation
  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Invalid email format';
  static const String passwordRequired = 'Password is required';
  static const String passwordTooShort =
      'Password must be at least 8 characters';
  static const String passwordTooLong =
      'Password must be less than 50 characters';

  // Errors
  static const String networkError =
      'Network error. Please check your connection.';
  static const String serverError = 'Server error. Please try again later.';
  static const String unauthorizedError =
      'Session expired. Please login again.';
  static const String unknownError = 'An unknown error occurred.';

  // Prevent instantiation
  AppStrings._();
}
