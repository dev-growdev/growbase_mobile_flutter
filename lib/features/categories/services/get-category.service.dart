import '../../../shared/adapters/api.adapter.dart';
import '../entities/category.entity.dart';

class GetCategoryService {
  final IHttpAdapter _http;

  const GetCategoryService(this._http);

  Future<Category> call(String uid) async {
    final response = await _http.get('/categories/$uid');

    return Category.fromMap(response['data']);
  }
}
