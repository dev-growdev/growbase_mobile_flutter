// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-account.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAccountStore on CreateAccountStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'CreateAccountStoreBase.isLoading'))
          .value;
  Computed<Failure?>? _$failureComputed;

  @override
  Failure? get failure =>
      (_$failureComputed ??= Computed<Failure?>(() => super.failure,
              name: 'CreateAccountStoreBase.failure'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'CreateAccountStoreBase._state', context: context);

  @override
  CreateAccountDTO get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(CreateAccountDTO value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'CreateAccountStoreBase._isLoading', context: context);

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
      Atom(name: 'CreateAccountStoreBase._failure', context: context);

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

  late final _$createAccountAsyncAction =
      AsyncAction('CreateAccountStoreBase.createAccount', context: context);

  @override
  Future<bool> createAccount() {
    return _$createAccountAsyncAction.run(() => super.createAccount());
  }

  late final _$CreateAccountStoreBaseActionController =
      ActionController(name: 'CreateAccountStoreBase', context: context);

  @override
  void _clearFailure() {
    final _$actionInfo = _$CreateAccountStoreBaseActionController.startAction(
        name: 'CreateAccountStoreBase._clearFailure');
    try {
      return super._clearFailure();
    } finally {
      _$CreateAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(
      {String? name, String? email, String? document, String? password}) {
    final _$actionInfo = _$CreateAccountStoreBaseActionController.startAction(
        name: 'CreateAccountStoreBase.setState');
    try {
      return super.setState(
          name: name, email: email, document: document, password: password);
    } finally {
      _$CreateAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
failure: ${failure}
    ''';
  }
}
