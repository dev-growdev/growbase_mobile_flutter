// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCategoriesStore on GetCategoriesStoreBase, Store {
  Computed<List<Category>>? _$stateComputed;

  @override
  List<Category> get state =>
      (_$stateComputed ??= Computed<List<Category>>(() => super.state,
              name: 'GetCategoriesStoreBase.state'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'GetCategoriesStoreBase.isLoading'))
          .value;
  Computed<Failure?>? _$failureComputed;

  @override
  Failure? get failure =>
      (_$failureComputed ??= Computed<Failure?>(() => super.failure,
              name: 'GetCategoriesStoreBase.failure'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'GetCategoriesStoreBase._state', context: context);

  @override
  ObservableList<Category> get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(ObservableList<Category> value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'GetCategoriesStoreBase._isLoading', context: context);

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
      Atom(name: 'GetCategoriesStoreBase._failure', context: context);

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

  late final _$refreshAsyncAction =
      AsyncAction('GetCategoriesStoreBase.refresh', context: context);

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('GetCategoriesStoreBase.getCategories', context: context);

  @override
  Future<void> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  @override
  String toString() {
    return '''
state: ${state},
isLoading: ${isLoading},
failure: ${failure}
    ''';
  }
}
