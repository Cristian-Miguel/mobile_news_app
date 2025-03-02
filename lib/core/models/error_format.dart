class ErrorFormat {
  final String message;
  final String stackTrace;
  final String code;
  final String type;

  ErrorFormat(
      {required this.message,
      required this.stackTrace,
      required this.code,
      required this.type});
}
