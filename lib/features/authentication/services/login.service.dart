import 'package:growbase_mobile_flutter/utils/constants.dart';

import '../../../shared/adapters/api.adapter.dart';
import '../../../shared/entities/user.entity.dart';

class LoginService {
  final IHttpAdapter _http;

  const LoginService(this._http);

  Future<User> call({
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

    Constants.token = response['data']['token'];

    return User.fromMap(response['data']['user']);
  }
}
