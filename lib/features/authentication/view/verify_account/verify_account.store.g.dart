// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_account.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerifyAccountStore on VerifyAccountStoreBase, Store {
  Computed<String>? _$pinValueComputed;

  @override
  String get pinValue =>
      (_$pinValueComputed ??= Computed<String>(() => super.pinValue,
              name: 'VerifyAccountStoreBase.pinValue'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'VerifyAccountStoreBase.isLoading'))
          .value;
  Computed<Failure?>? _$failureComputed;

  @override
  Failure? get failure =>
      (_$failureComputed ??= Computed<Failure?>(() => super.failure,
              name: 'VerifyAccountStoreBase.failure'))
          .value;

  late final _$_pinValueAtom =
      Atom(name: 'VerifyAccountStoreBase._pinValue', context: context);

  @override
  String get _pinValue {
    _$_pinValueAtom.reportRead();
    return super._pinValue;
  }

  @override
  set _pinValue(String value) {
    _$_pinValueAtom.reportWrite(value, super._pinValue, () {
      super._pinValue = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'VerifyAccountStoreBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_failureAtom =
      Atom(name: 'VerifyAccountStoreBase._failure', context: context);

  @override
  Failure? get _failure {
    _$_failureAtom.reportRead();
    return super._failure;
  }

  @override
  set _failure(Failure? value) {
    _$_failureAtom.reportWrite(value, super._failure, () {
      super._failure = value;
    });
  }

  late final _$sendCodeAsyncAction =
      AsyncAction('VerifyAccountStoreBase.sendCode', context: context);

  @override
  Future<bool> sendCode(String login) {
    return _$sendCodeAsyncAction.run(() => super.sendCode(login));
  }

  late final _$verifyAccountAsyncAction =
      AsyncAction('VerifyAccountStoreBase.verifyAccount', context: context);

  @override
  Future<bool> verifyAccount(String login) {
    return _$verifyAccountAsyncAction.run(() => super.verifyAccount(login));
  }

  late final _$VerifyAccountStoreBaseActionController =
      ActionController(name: 'VerifyAccountStoreBase', context: context);

  @override
  void setPin(String text) {
    final _$actionInfo = _$VerifyAccountStoreBaseActionController.startAction(
        name: 'VerifyAccountStoreBase.setPin');
    try {
      return super.setPin(text);
    } finally {
      _$VerifyAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _clearFailure() {
    final _$actionInfo = _$VerifyAccountStoreBaseActionController.startAction(
        name: 'VerifyAccountStoreBase._clearFailure');
    try {
      return super._clearFailure();
    } finally {
      _$VerifyAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pinValue: ${pinValue},
isLoading: ${isLoading},
failure: ${failure}
    ''';
  }
}
