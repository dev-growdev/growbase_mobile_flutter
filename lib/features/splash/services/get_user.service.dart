import '../../../shared/adapters/api.adapter.dart';
import '../../../shared/entities/user_auth.entity.dart';

class GetUserService {
  final IHttpAdapter _http;

  const GetUserService(this._http);

  Future<UserAuth> call() async {
    final response = await _http.get('/auth');

    return UserAuth.fromMap(response['data']);
  }
}
