import '../../../shared/adapters/api.adapter.dart';
import '../entities/category.entity.dart';

class GetCategoriesService {
  final IHttpAdapter _http;

  const GetCategoriesService(this._http);

  Future<List<Category>> call() async {
    final response = await _http.get('/categories');

    return List<Category>.from(
      response['data'].map((e) => Category.fromMap(e)),
    );
  }
}
