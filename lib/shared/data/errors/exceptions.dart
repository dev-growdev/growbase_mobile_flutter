/// Esse Exception ocorre quando acontece um erro no adapter
class AdapterException implements Exception {
  String? message;
  AdapterException([this.message]);
}
