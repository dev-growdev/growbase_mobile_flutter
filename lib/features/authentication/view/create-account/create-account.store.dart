import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make-request.adapter.dart';
import '../../../../shared/errors/failures.dart';
import '../../dtos/create-account.dto.dart';
import '../../services/create-account.service.dart';

part 'create-account.store.g.dart';

class CreateAccountStore = _CreateAccountStore with _$CreateAccountStore;

abstract class _CreateAccountStore with Store {
  final CreateAccountService _service;

  _CreateAccountStore(this._service);

  @observable
  CreateAccountDTO _state = const CreateAccountDTO();

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
  void setState({
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

  @action
  Future<bool> createAccount() async {
    _clearFailure();
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
