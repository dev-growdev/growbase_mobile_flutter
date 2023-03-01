import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make-request.adapter.dart';
import '../../../../shared/errors/failures.dart';
import '../../services/login.service.dart';

part 'login.store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginService _service;

  LoginStoreBase(this._service);

  String _login = '';

  String _pass = '';

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
        await makeRequest(() => _service(login: _login, password: _pass));

    _isLoading = false;

    final result = resultOrError.fold(id, id);

    if (resultOrError.isLeft()) {
      _failure = result as Failure;
      return false;
    }

    return true;
  }
}
