import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/errors/failures.dart';
import '../../services/recovery_password.service.dart';

part 'recovery_password.store.g.dart';

class RecoveryPasswordStore = RecoveryPasswordStoreBase
    with _$RecoveryPasswordStore;

abstract class RecoveryPasswordStoreBase with Store {
  final RecoveryPasswordService _service;

  RecoveryPasswordStoreBase(this._service);

  @observable
  bool _isLoading = false;

  @observable
  Failure? _failure;

  @computed
  bool get isLoading => _isLoading;

  @computed
  Failure? get failure => _failure;

  @action
  Future<bool> sendRecovery(String login) async {
    _failure = null;
    _isLoading = true;

    final resultOrError = await makeRequest(() => _service(login));

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    return true;
  }
}
