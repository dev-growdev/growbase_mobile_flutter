import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/adapters/make-request.adapter.dart';
import '../../../../../shared/errors/failures.dart';
import '../../../entities/category.entity.dart';
import '../../../services/get-category.service.dart';

part 'get-category.store.g.dart';

class GetCategoryStore = _GetCategoryStore with _$GetCategoryStore;

abstract class _GetCategoryStore with Store {
  final GetCategoryService _service;

  _GetCategoryStore(this._service);

  @observable
  Category _state = const Category.empty();

  @computed
  Category get state => _state;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  @action
  Future<void> getCategory(String uid) async {
    _failure = null;
    _isLoading = true;

    final resultOrError = await makeRequest<Category>(() => _service.call(uid));

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return;
    }
    _state = resultOrError.fold(id, id) as Category;
  }
}
