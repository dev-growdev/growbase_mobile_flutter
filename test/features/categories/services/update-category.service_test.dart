import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/categories/services/update-category.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/features/categories/category.entity.builder.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final UpdateCategoryService sut = UpdateCategoryService(http);

  tearDown(() => reset(http));

  group('UpdateCategoryService -', () {
    final category = CategoryBuilder.init().build();
    test('deve chamar o método get do http com as informações', () async {
      when(() => http.put('/categories/${category.uid}', category.toMap()))
          .thenAnswer(
        (_) async => {
          'data': {
            'uid': 'any_uid',
            'name': 'any_name',
            'description': 'any_description',
          },
        },
      );

      await sut.call(category);

      verify(() => http.put('/categories/${category.uid}', category.toMap()))
          .called(1);
    });

    test('Deve retornar um true', () async {
      when(() => http.put(any(), any())).thenAnswer(
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

      final result = await sut.call(category);

      expect(result, isTrue);
    });
  });
}
