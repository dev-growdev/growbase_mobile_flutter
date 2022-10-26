import '../../../shared/adapters/api.adapter.dart';
import '../dtos/category.dto.dart';
import '../entities/category.entity.dart';

class CreateCategoryService {
  final IHttpAdapter _http;

  const CreateCategoryService(this._http);

  Future<Category> call(CategoryDTO dto) async {
    final response = await _http.post('/categories', dto.toMap());

    return Category.fromMap(response['data']);
  }
}
