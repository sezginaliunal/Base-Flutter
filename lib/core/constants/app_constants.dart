/// Global application constants
class AppConstants {
  // App Info
  static const String appName = 'BaseFlutter';
  static const String appVersion = '1.0.0';

  // API
  static const String apiBaseUrl = 'https://api.example.com';
  static const int apiTimeout = 30000; // milliseconds

  // Storage Keys
  static const String themeKey = 'theme_mode';
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String settingsBoxName = 'settings';
  static const String authBoxName = 'auth';

  // Pagination
  static const int defaultPageSize = 20;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;

  // Prevent instantiation
  AppConstants._();
}
