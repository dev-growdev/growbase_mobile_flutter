import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/errors/failures.dart';
import '../../services/send_verification_code.service.dart';
import '../../services/verify_account.service.dart';

part 'verify_account.store.g.dart';

class VerifyAccountStore = VerifyAccountStoreBase with _$VerifyAccountStore;

abstract class VerifyAccountStoreBase with Store {
  final VerifyAccountService _verifyAccountService;
  final SendVerificationCodeService _sendVerificationCodeService;

  VerifyAccountStoreBase({
    required VerifyAccountService verifyAccountService,
    required SendVerificationCodeService sendVerificationCodeService,
  })  : _verifyAccountService = verifyAccountService,
        _sendVerificationCodeService = sendVerificationCodeService;

  @observable
  String _pinValue = '';

  @observable
  bool _isLoading = false;

  @observable
  Failure? _failure;

  @computed
  String get pinValue => _pinValue;

  @computed
  bool get isLoading => _isLoading;

  @computed
  Failure? get failure => _failure;

  @action
  void setPin(String text) => _pinValue = text;

  @action
  void _clearFailure() => _failure = null;

  @action
  Future<bool> sendCode(String login) async {
    final resultOrError =
        await makeRequest(() => _sendVerificationCodeService(login));

    final result = resultOrError.fold(id, id);

    if (resultOrError.isLeft()) {
      return false;
    }

    return result as bool;
  }

  @action
  Future<bool> verifyAccount(String login) async {
    _clearFailure();
    _isLoading = true;

    final resultOrError = await makeRequest(
      () => _verifyAccountService(login: login, code: _pinValue),
    );

    _isLoading = false;

    final result = resultOrError.fold(id, id);

    if (resultOrError.isLeft()) {
      _failure = result as Failure;
      return false;
    }

    return true;
  }
}
