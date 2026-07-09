import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

/// Cubit for managing authentication state
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState());

  /// Login with email and password
  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    result.when(
      success: (user) {
        emit(
          state.copyWith(isLoading: false, isAuthenticated: true, user: user),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: false,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  /// Register a new user
  Future<void> register({
    required String email,
    required String password,
    required String name,
    String? surname,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _authRepository.register(
      email: email,
      password: password,
      name: name,
      surname: surname,
    );

    result.when(
      success: (user) {
        emit(
          state.copyWith(isLoading: false, isAuthenticated: true, user: user),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: false,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  /// Logout current user
  Future<void> logout() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _authRepository.logout();

    result.when(
      success: (_) {
        emit(const AuthState());
      },
      failure: (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
    );
  }

  /// Clear error message
  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }
}
