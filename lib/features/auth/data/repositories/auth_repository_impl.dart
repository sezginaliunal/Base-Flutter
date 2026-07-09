import '../../../../core/errors/result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    return await _remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<Result<UserEntity>> register({
    required String email,
    required String password,
    required String name,
    String? surname,
  }) async {
    return await _remoteDataSource.register(
      email: email,
      password: password,
      name: name,
      surname: surname,
    );
  }

  @override
  Future<Result<void>> logout() async {
    return await _remoteDataSource.logout();
  }

  @override
  Future<Result<UserEntity?>> getCurrentUser() async {
    // TODO: Implement getCurrentUser
    return const Success(null);
  }

  @override
  Future<Result<String>> refreshToken() async {
    return await _remoteDataSource.refreshToken();
  }

  @override
  Future<Result<void>> forgotPassword(String email) async {
    return await _remoteDataSource.forgotPassword(email);
  }

  @override
  Future<Result<void>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    return await _remoteDataSource.resetPassword(
      token: token,
      newPassword: newPassword,
    );
  }

  @override
  Future<Result<void>> verifyEmail(String token) async {
    return await _remoteDataSource.verifyEmail(token);
  }

  @override
  Future<Result<bool>> isAuthenticated() async {
    // TODO: Implement isAuthenticated
    return const Success(false);
  }

  @override
  Future<Result<void>> clearAuthData() async {
    // TODO: Implement clearAuthData
    return const Success(null);
  }
}
