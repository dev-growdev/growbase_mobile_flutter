import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/errors/failures.dart';
import '../../../../shared/adapters/make_request.adapter.dart';
import '../../services/update_password.service.dart';

part 'update_password.store.g.dart';

class UpdatePasswordStore = UpdatePasswordStoreBase with _$UpdatePasswordStore;

abstract class UpdatePasswordStoreBase with Store {
  final UpdatePasswordService _service;

  UpdatePasswordStoreBase(this._service);

  String? _password;
  String? _newPassword;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  void setPassword(String value) => _password = value;
  void setNewPassword(String value) => _newPassword = value;

  @action
  Future<bool> updatePassword() async {
    _failure = null;
    _isLoading = true;

    final resultOrError = await makeRequest(
      () => _service.call(
        password: _password!,
        newPassword: _newPassword!,
      ),
    );

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    return true;
  }
}
