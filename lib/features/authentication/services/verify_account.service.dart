import '../../../shared/adapters/api.adapter.dart';

class VerifyAccountService {
  final IHttpAdapter _http;

  const VerifyAccountService(this._http);

  Future<bool> call({
    required String login,
    required String code,
  }) async {
    // await _http.post('/send-verification-code', {'email': login});

    return true;
  }
}
