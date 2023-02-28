import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/adapters/make-request.adapter.dart';
import '../../../../../shared/errors/failures.dart';
import '../../../dtos/category.dto.dart';
import '../../../entities/category.entity.dart';
import '../../../services/create-category.service.dart';

part 'create-category.store.g.dart';

class CreateCategoryStore = CreateCategoryStoreBase with _$CreateCategoryStore;

abstract class CreateCategoryStoreBase with Store {
  final CreateCategoryService _service;

  CreateCategoryStoreBase(this._service);

  @observable
  CategoryDTO _state = CategoryDTO();

  @computed
  CategoryDTO get state => _state;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  @action
  void setState({
    String? name,
    String? description,
  }) {
    _state = _state.copyWith(
      name: name,
      description: description,
    );
  }

  @action
  Future<bool> createCategory() async {
    _failure = null;
    _isLoading = true;

    final resultOrError =
        await makeRequest<Category>(() => _service.call(state));

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    return true;
  }
}
