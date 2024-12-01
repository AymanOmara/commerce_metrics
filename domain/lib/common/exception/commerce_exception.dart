abstract interface class CommerceException implements Exception {
  final String message;

  const CommerceException(
    this.message,
  );
}
