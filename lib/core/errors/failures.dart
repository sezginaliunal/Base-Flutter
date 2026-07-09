/// Base failure class for all domain errors
abstract class Failure {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

/// Server failure (5xx errors)
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

/// Network failure (connection issues)
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

/// Authentication failure (401, 403)
class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.code});
}

/// Cache failure (local storage issues)
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

/// Validation failure (input validation errors)
class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.code});
}

/// Unknown failure
class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.code});
}
