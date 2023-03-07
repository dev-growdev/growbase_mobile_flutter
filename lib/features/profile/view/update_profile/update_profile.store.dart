import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/errors/failures.dart';
import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/entities/user.entity.dart';
import '../../../../shared/view/stores/app.store.dart';
import '../../services/update_profile.service.dart';

part 'update_profile.store.g.dart';

class UpdateProfileStore = UpdateProfileStoreBase with _$UpdateProfileStore;

abstract class UpdateProfileStoreBase with Store {
  final UpdateProfileService _service;
  final AppStore _appStore;

  UpdateProfileStoreBase({
    required UpdateProfileService service,
    required AppStore appStore,
    required User user,
  })  : _service = service,
        _appStore = appStore,
        _userUpdated = user;

  @observable
  User _userUpdated;

  @computed
  User get userUpdated => _userUpdated;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  @action
  void _setUser({
    String? name,
    String? document,
    String? email,
    String? phone,
  }) {
    _userUpdated = _userUpdated.copyWith(
      name: name,
      document: document,
      email: email,
      phone: phone,
    );
  }

  void setName(String name) => _setUser(name: name);
  void setEmail(String email) => _setUser(email: email);
  void setDocument(String document) => _setUser(document: document);
  void setPhone(String phone) => _setUser(phone: phone);

  @action
  Future<bool> updateUser() async {
    _failure = null;
    _isLoading = true;

    if (_appStore.user == _userUpdated) {
      _isLoading = false;
      return true;
    }

    final resultOrError = await makeRequest(() => _service.call(_userUpdated));

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    _appStore.addUser(_userUpdated);

    return true;
  }
}
