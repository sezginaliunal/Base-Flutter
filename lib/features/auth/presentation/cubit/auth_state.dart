import '../../domain/entities/user_entity.dart';

/// Authentication state class
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final UserEntity? user;
  final String? errorMessage;

  const AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    UserEntity? user,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isAuthenticated == other.isAuthenticated &&
          user == other.user &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      isAuthenticated.hashCode ^
      user.hashCode ^
      errorMessage.hashCode;

  @override
  String toString() =>
      'AuthState(isLoading: $isLoading, isAuthenticated: $isAuthenticated, user: $user, errorMessage: $errorMessage)';
}
