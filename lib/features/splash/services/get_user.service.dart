import '../../../shared/adapters/api.adapter.dart';
import '../../../shared/entities/user.entity.dart';
import '../../../shared/entities/user_auth.entity.dart';

class GetUserService {
  final IHttpAdapter _http;

  const GetUserService(this._http);

  Future<UserAuth> call() async {
    final response = await _http.get('/auth');

    return UserAuth.fromMap(response['data']);
  }
}

Future<UserAuth> mock() async {
  await Future.delayed(const Duration(seconds: 2));
  return const UserAuth(
    token: 'token',
    user: User(
      uid: '123',
      email: 'thobias@gmail.com',
      name: 'Thobias S',
    ),
  );
}
