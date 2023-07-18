import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/constants/app.constants.dart';
import '../../adapters/shared_preference.adapter.dart';
import '../../entities/user.entity.dart';

part 'app.store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  User? _user;

  @computed
  User? get user => _user;

  @action
  void addUser(User user) => _user = user;

  @action
  void clearUser() => _user = null;

  @action
  Future<void> logout() async {
    clearUser();
    AppConstants.token = null;
    await GetIt.I<ILocalStorage>().removeValue('userLogged');
  }
}
