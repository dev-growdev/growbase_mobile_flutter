import '../../../shared/adapters/api.adapter.dart';
import '../../../shared/entities/user.entity.dart';
import '../dtos/create-account.dto.dart';

class CreateAccountService {
  final IHttpAdapter _http;

  const CreateAccountService(this._http);

  Future<User> call(CreateAccountDTO dto) async {
    final response = await _http.post('/signup', dto.toMap());

    return User.fromMap(response['data']);
  }
}
