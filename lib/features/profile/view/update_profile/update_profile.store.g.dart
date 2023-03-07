// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateProfileStore on UpdateProfileStoreBase, Store {
  Computed<User>? _$userUpdatedComputed;

  @override
  User get userUpdated =>
      (_$userUpdatedComputed ??= Computed<User>(() => super.userUpdated,
              name: 'UpdateProfileStoreBase.userUpdated'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'UpdateProfileStoreBase.isLoading'))
          .value;
  Computed<Failure?>? _$failureComputed;

  @override
  Failure? get failure =>
      (_$failureComputed ??= Computed<Failure?>(() => super.failure,
              name: 'UpdateProfileStoreBase.failure'))
          .value;

  late final _$_userUpdatedAtom =
      Atom(name: 'UpdateProfileStoreBase._userUpdated', context: context);

  @override
  User get _userUpdated {
    _$_userUpdatedAtom.reportRead();
    return super._userUpdated;
  }

  @override
  set _userUpdated(User value) {
    _$_userUpdatedAtom.reportWrite(value, super._userUpdated, () {
      super._userUpdated = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'UpdateProfileStoreBase._isLoading', context: context);

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
      Atom(name: 'UpdateProfileStoreBase._failure', context: context);

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

  late final _$updateUserAsyncAction =
      AsyncAction('UpdateProfileStoreBase.updateUser', context: context);

  @override
  Future<bool> updateUser() {
    return _$updateUserAsyncAction.run(() => super.updateUser());
  }

  late final _$UpdateProfileStoreBaseActionController =
      ActionController(name: 'UpdateProfileStoreBase', context: context);

  @override
  void _setUser(
      {String? name, String? document, String? email, String? phone}) {
    final _$actionInfo = _$UpdateProfileStoreBaseActionController.startAction(
        name: 'UpdateProfileStoreBase._setUser');
    try {
      return super
          ._setUser(name: name, document: document, email: email, phone: phone);
    } finally {
      _$UpdateProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userUpdated: ${userUpdated},
isLoading: ${isLoading},
failure: ${failure}
    ''';
  }
}
