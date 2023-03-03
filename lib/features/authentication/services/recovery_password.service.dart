import '../../../shared/adapters/api.adapter.dart';

class RecoveryPasswordService {
  final IHttpAdapter _http;

  const RecoveryPasswordService(this._http);

  Future<bool> call(String login) async {
    await _http.post('/account/reset-password', {'email': login});

    return true;
  }
}
