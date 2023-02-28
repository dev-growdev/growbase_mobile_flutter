// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-category.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCategoryStore on CreateCategoryStoreBase, Store {
  Computed<CategoryDTO>? _$stateComputed;

  @override
  CategoryDTO get state =>
      (_$stateComputed ??= Computed<CategoryDTO>(() => super.state,
              name: 'CreateCategoryStoreBase.state'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'CreateCategoryStoreBase.isLoading'))
          .value;
  Computed<Failure?>? _$failureComputed;

  @override
  Failure? get failure =>
      (_$failureComputed ??= Computed<Failure?>(() => super.failure,
              name: 'CreateCategoryStoreBase.failure'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'CreateCategoryStoreBase._state', context: context);

  @override
  CategoryDTO get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(CategoryDTO value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'CreateCategoryStoreBase._isLoading', context: context);

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
      Atom(name: 'CreateCategoryStoreBase._failure', context: context);

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

  late final _$createCategoryAsyncAction =
      AsyncAction('CreateCategoryStoreBase.createCategory', context: context);

  @override
  Future<bool> createCategory() {
    return _$createCategoryAsyncAction.run(() => super.createCategory());
  }

  late final _$CreateCategoryStoreBaseActionController =
      ActionController(name: 'CreateCategoryStoreBase', context: context);

  @override
  void setState({String? name, String? description}) {
    final _$actionInfo = _$CreateCategoryStoreBaseActionController.startAction(
        name: 'CreateCategoryStoreBase.setState');
    try {
      return super.setState(name: name, description: description);
    } finally {
      _$CreateCategoryStoreBaseActionController.endAction(_$actionInfo);
    }
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
