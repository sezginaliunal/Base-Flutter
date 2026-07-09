import 'failures.dart';

/// Sealed Result class for handling success/failure states
/// Provides type-safe error handling without external dependencies
sealed class Result<T> {
  const Result();

  /// Returns success value or null if failure
  T? get successOrNull;

  /// Returns failure or null if success
  Failure? get failureOrNull;

  /// Returns true if success
  bool get isSuccess => this is Success<T>;

  /// Returns true if failure
  bool get isFailure => this is FailureResult<T>;

  /// Maps success value to R
  R map<R>({
    required R Function(T value) success,
    required R Function(Failure failure) failure,
  });

  /// Maps success value to R with pattern matching
  R when<R>({
    required R Function(T value) success,
    required R Function(Failure failure) failure,
  }) => map(success: success, failure: failure);
}

/// Success state containing data
class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);

  @override
  T? get successOrNull => data;

  @override
  Failure? get failureOrNull => null;

  @override
  R map<R>({
    required R Function(T value) success,
    required R Function(Failure failure) failure,
  }) => success(data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success(data: $data)';
}

/// Failure state containing error information
class FailureResult<T> extends Result<T> {
  final Failure failure;

  const FailureResult(this.failure);

  @override
  T? get successOrNull => null;

  @override
  Failure? get failureOrNull => failure;

  @override
  R map<R>({
    required R Function(T value) success,
    required R Function(Failure failure) failure,
  }) => failure(this.failure);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FailureResult<T> &&
          runtimeType == other.runtimeType &&
          failure == other.failure;

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() => 'FailureResult(failure: $failure)';
}

/// Extension methods for Result
extension ResultExtension<T> on Result<T> {
  /// Returns success data or throws failure
  T getOrThrow() {
    return switch (this) {
      Success<T>(data: final data) => data,
      FailureResult<T>(failure: final failure) => throw failure,
    };
  }

  /// Returns success data or default value
  T getOrDefault(T defaultValue) {
    return switch (this) {
      Success<T>(data: final data) => data,
      FailureResult<T>() => defaultValue,
    };
  }

  /// Returns success data or calls error handler
  T getOrElse(T Function(Failure failure) onError) {
    return switch (this) {
      Success<T>(data: final data) => data,
      FailureResult<T>(failure: final failure) => onError(failure),
    };
  }
}
