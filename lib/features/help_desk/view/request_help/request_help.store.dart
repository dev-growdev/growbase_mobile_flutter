import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/errors/failures.dart';
import '../../services/request_help.service.dart';

part 'request_help.store.g.dart';

class RequestHelpStore = RequestHelpStoreBase with _$RequestHelpStore;

abstract class RequestHelpStoreBase with Store {
  final RequestHelpService _service;

  RequestHelpStoreBase(this._service);

  String _message = '';

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  void setMessage(String value) => _message = value;

  @action
  Future<bool> requestHelp() async {
    _failure = null;
    _isLoading = true;

    final resultOrError = await makeRequest(() => _service(_message));

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    return true;
  }
}
