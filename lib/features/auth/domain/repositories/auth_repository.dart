import '../../../../core/errors/result.dart';
import '../entities/user_entity.dart';

/// Abstract repository for authentication operations
abstract class AuthRepository {
  /// Login with email and password
  Future<Result<UserEntity>> login({
    required String email,
    required String password,
  });

  /// Register a new user
  Future<Result<UserEntity>> register({
    required String email,
    required String password,
    required String name,
    String? surname,
  });

  /// Logout current user
  Future<Result<void>> logout();

  /// Get current user
  Future<Result<UserEntity?>> getCurrentUser();

  /// Refresh access token
  Future<Result<String>> refreshToken();

  /// Request password reset
  Future<Result<void>> forgotPassword(String email);

  /// Reset password with token
  Future<Result<void>> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Verify email
  Future<Result<void>> verifyEmail(String token);

  /// Check if user is authenticated
  Future<Result<bool>> isAuthenticated();

  /// Clear all authentication data
  Future<Result<void>> clearAuthData();
}
