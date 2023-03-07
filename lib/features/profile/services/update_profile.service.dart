import '../../../shared/adapters/api.adapter.dart';
import '../../../shared/entities/user.entity.dart';

class UpdateProfileService {
  final IHttpAdapter _http;

  const UpdateProfileService(this._http);

  Future<bool> call(User user) async {
    await _http.put('/account/profile/', user.toMap());

    return true;
  }
}
