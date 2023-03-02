import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/categories/services/get_categories.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/features/categories/category.entity.builder.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final GetCategoriesService sut = GetCategoriesService(http);

  tearDown(() => reset(http));

  group('GetCategoriesService -', () {
    test('deve chamar o método get do http com as informações', () async {
      when(() => http.get('/categories')).thenAnswer(
        (_) async => {
          'data': [
            {
              'uid': 'any_uid',
              'name': 'any_name',
              'description': 'any_description',
            }
          ],
        },
      );

      await sut.call();

      verify(() => http.get('/categories')).called(1);
    });

    test('Deve retornar uma lista de  Category', () async {
      when(() => http.get(any())).thenAnswer(
        (_) async => {
          'success': true,
          'code': 200,
          'data': [
            {
              'uid': 'any_uid',
              'name': 'any_name',
              'description': 'any_description',
            }
          ],
        },
      );

      final result = await sut.call();

      expect(result, equals([CategoryBuilder.init().build()]));
    });
  });
}
