import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/categories/services/create_category.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/features/categories/category.dto.builder.dart';
import '../../../builders/features/categories/category.entity.builder.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final CreateCategoryService sut = CreateCategoryService(http);

  tearDown(() => reset(http));

  group('CreateCategoryService -', () {
    final dto = CategoryDTOBuilder.init().build();

    test('deve chamar o método post do http com as informações', () async {
      when(() => http.post('/categories', dto.toMap())).thenAnswer(
        (_) async => {
          'data': {
            'uid': 'any_uid',
            'name': 'any_name',
            'description': 'any_description',
          },
        },
      );

      await sut.call(dto);

      verify(() => http.post('/categories', dto.toMap())).called(1);
    });

    test('Deve retornar uma Category', () async {
      when(() => http.post(any(), any())).thenAnswer(
        (_) async => {
          'success': true,
          'code': 200,
          'data': {
            'uid': 'any_uid',
            'name': 'any_name',
            'description': 'any_description',
          },
        },
      );

      final result = await sut.call(dto);

      expect(result, CategoryBuilder.init().build());
    });
  });
}
