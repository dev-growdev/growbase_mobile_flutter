import 'package:dartz/dartz.dart';
import 'package:growbase_mobile_flutter/features/help_desk/entities/faq.entity.dart';
import 'package:growbase_mobile_flutter/features/help_desk/services/get_faqs.service.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/adapters/make_request.adapter.dart';
import '../../../../shared/errors/failures.dart';

part 'faqs.store.g.dart';

class FaqsStore = FaqsStoreBase with _$FaqsStore;

abstract class FaqsStoreBase with Store {
  final GetFaqsService _service;

  FaqsStoreBase(this._service);

  @observable
  ObservableList<Faq> _state = <Faq>[].asObservable();

  @computed
  List<Faq> get state => _state;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure? _failure;

  @computed
  Failure? get failure => _failure;

  @action
  Future<void> getFaqs() async {
    _failure = null;
    _isLoading = true;

    final resultOrError = await makeRequest(() => _service());

    _isLoading = false;

    if (resultOrError.isLeft()) {
      _failure = resultOrError.fold(id, id) as Failure;
      return;
    }

    _state = ObservableList.of(resultOrError.fold(id, id) as List<Faq>);
  }
}
