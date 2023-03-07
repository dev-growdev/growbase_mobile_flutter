import '../../../shared/adapters/api.adapter.dart';

class UpdatePasswordService {
  final IHttpAdapter _http;

  const UpdatePasswordService(this._http);

  Future<bool> call({
    required String password,
    required String newPassword,
  }) async {
    await _http.put('/account/update-password', {
      'password': password,
      'new_password': newPassword,
    });

    return true;
  }
}
