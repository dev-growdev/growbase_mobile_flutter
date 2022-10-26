import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/categories/entities/category.entity.dart';
import 'package:growbase_mobile_flutter/features/categories/services/get-category.service.dart';
import 'package:growbase_mobile_flutter/features/categories/view/category/stores/get-category.store.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:growbase_mobile_flutter/shared/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../builders/features/categories/category.entity.builder.dart';

class MockDio extends Mock implements Dio {}

GetCategoryStore makeStore(Dio dio) => GetCategoryStore(
      GetCategoryService(
        ApiAdapter(dio),
      ),
    );

void main() {
  final dio = MockDio();
  const categoryUid = 'any_uid';

  group('GetCategoryStore', () {
    test('Deve retornar uma Categoria', () async {
      final store = makeStore(dio);
      when(() => dio.get('/categories/$categoryUid',
          options: any(named: 'options'))).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'success': true,
              'code': 200,
              'data': {
                'uid': 'any_uid',
                'name': 'any_name',
                'description': 'any_description',
              },
            },
            statusCode: 200,
          ),
        ),
      );

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);
      expect(store.state, equals(const Category.empty()));

      await store.getCategory(categoryUid);

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);
      expect(store.state, equals(CategoryBuilder.init().build()));
    });

    test(
        'Deve retornar um false e setar o failure com o erro ao buscar uma categoria',
        () async {
      final store = makeStore(dio);
      when(() => dio.get('/categories/$categoryUid',
          options: any(named: 'options'))).thenThrow(
        DioError(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'success': false,
              'code': 500,
              'error': {
                'process': 'any',
                'message': 'Erro genérico',
                'details': []
              }
            },
            statusCode: 500,
          ),
        ),
      );

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);
      expect(store.state, equals(const Category.empty()));

      await store.getCategory(categoryUid);

      expect(store.isLoading, isFalse);
      expect(store.failure, ServerFailure('Erro genérico'));
      expect(store.state, equals(const Category.empty()));
    });
  });
}
