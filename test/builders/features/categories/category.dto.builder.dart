import 'package:growbase_mobile_flutter/features/categories/dtos/category.dto.dart';

class CategoryDTOBuilder {
  final String _name = 'any_name';
  final String _description = 'any_description';

  static CategoryDTOBuilder init() => CategoryDTOBuilder();

  CategoryDTO build() {
    return CategoryDTO(
      name: _name,
      description: _description,
    );
  }
}
