import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/errors/failures.dart';
import '../../dtos/create-account.dto.dart';
import '../../services/create_account.service.dart';

part 'create_account.store.g.dart';

class CreateAccountStore = CreateAccountStoreBase with _$CreateAccountStore;

abstract class CreateAccountStoreBase with Store {
  final CreateAccountService _service;

  CreateAccountStoreBase(this._service);

  @observable
  CreateAccountDTO _state = const CreateAccountDTO();

  @computed
  CreateAccountDTO get state => _state;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  @action
  void clearFailure() => _failure = null;

  @action
  void _setState({
    String? name,
    String? email,
    String? document,
    String? password,
  }) =>
      _state = _state.copyWith(
        name: name,
        email: email,
        document: document,
        password: password,
      );

  void setName(String name) => _setState(name: name);
  void setEmail(String email) => _setState(email: email);
  void setDocument(String document) => _setState(document: document);
  void setPassword(String password) => _setState(password: password);

  @action
  Future<bool> createAccount() async {
    clearFailure();
    _isLoading = true;

    final resultOrError = await makeRequest(() => _service.call(_state));

    _isLoading = false;

    final result = resultOrError.fold(id, id);

    if (resultOrError.isLeft()) {
      _failure = result as Failure;
      return false;
    }

    return true;
  }
}
