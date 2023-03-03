import '../../../shared/adapters/api.adapter.dart';

class SendVerificationCodeService {
  final IHttpAdapter _http;

  const SendVerificationCodeService(this._http);

  Future<bool> call(String login) async {
    await _http.post('/verify-account', {
      'email': login,
    });

    return true;
  }
}
