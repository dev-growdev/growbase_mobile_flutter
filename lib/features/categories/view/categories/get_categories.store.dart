import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/errors/failures.dart';
import '../../entities/category.entity.dart';
import '../../services/get_categories.service.dart';

part 'get_categories.store.g.dart';

class GetCategoriesStore = GetCategoriesStoreBase with _$GetCategoriesStore;

abstract class GetCategoriesStoreBase with Store {
  final GetCategoriesService _getCategoriesService;

  GetCategoriesStoreBase(this._getCategoriesService);

  @observable
  ObservableList<Category> _state = <Category>[].asObservable();

  @computed
  List<Category> get state => _state;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  @action
  Future<void> refresh() async {
    final resultOrError = await makeRequest(() => _getCategoriesService());
    if (resultOrError.isLeft()) return;

    _state = ObservableList.of(resultOrError.fold(id, id) as List<Category>);
  }

  @action
  Future<void> getCategories() async {
    _failure = null;
    _isLoading = true;

    final resultOrError = await makeRequest(() => _getCategoriesService());

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return;
    }

    _state = ObservableList.of(resultOrError.fold(id, id) as List<Category>);
  }
}
