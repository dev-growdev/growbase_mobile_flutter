import '../../../shared/adapters/shared_preference.adapter.dart';
import '../../../utils/constants/app.constants.dart';

class LoadSavedTokenService {
  final ILocalStorage _localStorage;

  const LoadSavedTokenService(this._localStorage);

  Future<String?> call() async {
    final token = await _localStorage.getValue('userLogged');
    AppConstants.token = token;
    return token;
  }
}
