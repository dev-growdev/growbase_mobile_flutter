import 'package:growbase_mobile_flutter/features/help_desk/entities/faq.entity.dart';

import '../../../shared/adapters/api.adapter.dart';

class GetFaqsService {
  final IHttpAdapter _http;

  const GetFaqsService(this._http);

  Future<List<Faq>> call() async {
    final response = await _http.get('/categories');

    return (response['data'] as List<Map<String, dynamic>>)
        .map(Faq.fromMap)
        .toList();
  }
}
