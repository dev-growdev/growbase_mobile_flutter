class HttpResponse {
  bool success;
  int statusCode;
  Map<String, dynamic>? result;
  dynamic error;

  HttpResponse({
    required this.success,
    required this.statusCode,
    this.result,
    this.error,
  });
}
