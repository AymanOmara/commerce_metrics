import 'package:domain/common/exception/commerce_exception.dart';

sealed class Result<S, CommerceException> {
  const Result();
}

final class Success<S, E> extends Result<S, E> {
  const Success(this.data);

  final S data;
}

final class Failure<S, E extends CommerceException> extends Result<S, E> {
  const Failure(this.exception);

  final E exception;
}
