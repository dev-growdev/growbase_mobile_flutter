import '../../../shared/adapters/api.adapter.dart';
import '../entities/category.entity.dart';

class UpdateCategoryService {
  final IHttpAdapter _http;

  const UpdateCategoryService(this._http);

  Future<bool> call(Category category) async {
    await _http.put('/categories/${category.uid}', category.toMap());

    return true;
  }
}
