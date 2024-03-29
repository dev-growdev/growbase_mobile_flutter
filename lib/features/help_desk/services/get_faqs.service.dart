import '../../../shared/adapters/api.adapter.dart';
import '../entities/faq.entity.dart';

class GetFaqsService {
  final IHttpAdapter _http;

  const GetFaqsService(this._http);

  Future<List<Faq>> call() async {
    final response = await _http.get('/faqs');

    return List<Faq>.from(
      response['data'].map((e) => Faq.fromMap(e)),
    );
  }
}
