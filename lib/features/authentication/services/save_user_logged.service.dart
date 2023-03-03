import '../../../shared/adapters/shared_preference.adapter.dart';
import '../../../shared/entities/user_auth.entity.dart';
import '../../../shared/view/stores/app.store.dart';
import '../../../utils/constants.dart';

class SaveUserLoggedService {
  final ILocalStorage _localStorage;
  final AppStore _appStore;

  const SaveUserLoggedService({
    required ILocalStorage localStorage,
    required AppStore appStore,
  })  : _localStorage = localStorage,
        _appStore = appStore;

  Future<bool> call(UserAuth userAuth) async {
    await _localStorage.setValue('userLogged', userAuth.token);

    _appStore.addUser(userAuth.user);
    Constants.token = userAuth.token;

    return true;
  }
}
