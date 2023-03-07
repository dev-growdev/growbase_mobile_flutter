import '../../../shared/adapters/api.adapter.dart';

class RequestHelpService {
  final IHttpAdapter _http;

  const RequestHelpService(this._http);

  Future<void> call(String question) async {
    await _http.post('/help', {
      'question': question,
    });
  }
}
