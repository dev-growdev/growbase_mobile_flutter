import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/entities/user_auth.entity.dart';
import '../../../../shared/errors/failures.dart';
import '../../services/login.service.dart';
import '../../services/save_user_logged.service.dart';

part 'login.store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginService _loginService;
  final SaveUserLoggedService _saveUserLoggedService;

  LoginStoreBase({
    required LoginService loginService,
    required SaveUserLoggedService saveUserLoggedService,
  })  : _loginService = loginService,
        _saveUserLoggedService = saveUserLoggedService;

  String _login = '';

  String _pass = '';

  String get login => _login;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  @action
  void _clearFailure() => _failure = null;

  @action
  void setLogin(String text) {
    _login = text;
    _clearFailure();
  }

  @action
  void setPass(String text) {
    _pass = text;
    _clearFailure();
  }

  @action
  Future<bool> signIn() async {
    _clearFailure();
    _isLoading = true;

    final resultOrError =
        await makeRequest(() => _loginService(login: _login, password: _pass));

    final result = resultOrError.fold(id, id);

    if (resultOrError.isLeft()) {
      _failure = result as Failure;
      _isLoading = false;
      return false;
    }

    await saveUserLogged(result as UserAuth);

    _isLoading = false;

    return true;
  }

  Future<void> saveUserLogged(UserAuth userAuth) =>
      makeRequest(() => _saveUserLoggedService(userAuth));
}
