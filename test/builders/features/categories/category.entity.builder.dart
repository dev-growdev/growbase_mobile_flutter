import 'package:growbase_mobile_flutter/features/categories/entities/category.entity.dart';

class CategoryBuilder {
  final String _uid = 'any_uid';
  final String _name = 'any_name';
  final String _description = 'any_description';

  static CategoryBuilder init() => CategoryBuilder();

  Category build() {
    return Category(
      uid: _uid,
      name: _name,
      description: _description,
    );
  }
}
