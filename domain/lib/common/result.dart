import 'package:domain/common/exception/commerce_exception.dart';

sealed class Result<S, E> {
  const Result();

  T fold<T>({
    required T Function(S data) onSuccess,
    required T Function(E exception) onFailure,
  });
}

final class Success<S, E> extends Result<S, E> {
  const Success(this.data);

  final S data;

  @override
  T fold<T>({
    required T Function(S data) onSuccess,
    required T Function(E exception) onFailure,
  }) {
    return onSuccess(data);
  }
}

final class Failure<S, E extends CommerceException> extends Result<S, E> {
  const Failure(this.exception);

  final E exception;

  @override
  T fold<T>({
    required T Function(S data) onSuccess,
    required T Function(E exception) onFailure,
  }) {
    return onFailure(exception);
  }
}

extension ResultExtensions<S, E extends CommerceException> on Result<S, E> {
  S? asSuccess() => this is Success<S, E> ? (this as Success<S, E>).data : null;

  E? asFailure() =>
      this is Failure<S, E> ? (this as Failure<S, E>).exception : null;
}
