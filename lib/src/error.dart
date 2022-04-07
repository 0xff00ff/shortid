class ShortIdError extends Error {
  final String message;
  ShortIdError(this.message);
  @override
  String toString() => message;
}
