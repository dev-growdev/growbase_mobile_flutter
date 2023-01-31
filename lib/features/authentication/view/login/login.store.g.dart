// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_LoginStore.isLoading'))
      .value;
  Computed<Failure?>? _$failureComputed;

  @override
  Failure? get failure => (_$failureComputed ??=
          Computed<Failure?>(() => super.failure, name: '_LoginStore.failure'))
      .value;

  late final _$_isLoadingAtom =
      Atom(name: '_LoginStore._isLoading', context: context);

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
      Atom(name: '_LoginStore._failure', context: context);

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

  late final _$signInAsyncAction =
      AsyncAction('_LoginStore.signIn', context: context);

  @override
  Future<bool> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void _clearFailure() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore._clearFailure');
    try {
      return super._clearFailure();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogin(String text) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setLogin');
    try {
      return super.setLogin(text);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String text) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setPass');
    try {
      return super.setPass(text);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
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
