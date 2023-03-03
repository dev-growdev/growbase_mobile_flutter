import '../../../shared/adapters/api.adapter.dart';

class VerifyAccountService {
  final IHttpAdapter _http;

  const VerifyAccountService(this._http);

  Future<bool> call({
    required String login,
    required String code,
  }) async {
    await _http.post('/verify-account', {
      'email': login,
      'code': code,
    });

    return true;
  }
}
