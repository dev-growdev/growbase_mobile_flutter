import '../../../shared/adapters/api.adapter.dart';
import '../../../shared/entities/user_auth.entity.dart';

class LoginService {
  final IHttpAdapter _http;

  const LoginService(this._http);

  Future<UserAuth> call({
    required String login,
    required String password,
  }) async {
    final response = await _http.post(
      '/signin',
      {
        'login': login,
        'password': password,
      },
    );

    return UserAuth.fromMap(response['data']);
  }
}
