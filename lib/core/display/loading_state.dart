import 'package:domain/common/exception/commerce_exception.dart';

sealed class LoadingState {}

class Loading extends LoadingState {
  Loading();
}

class Idle extends LoadingState {}

class LoadingSuccess extends LoadingState {
  LoadingSuccess();
}

class LoadingException extends LoadingState {
  final CommerceException exception;

  LoadingException(
    this.exception,
  );
}
