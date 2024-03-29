import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/categories/entities/category.entity.dart';
import 'package:growbase_mobile_flutter/features/categories/services/update_category.service.dart';
import 'package:growbase_mobile_flutter/features/categories/view/category/stores/update_category.store.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:growbase_mobile_flutter/shared/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../builders/features/categories/category.entity.builder.dart';

class MockDio extends Mock implements Dio {}

UpdateCategoryStore makeStore(Dio dio) => UpdateCategoryStore(
      UpdateCategoryService(
        ApiAdapter(dio),
      ),
    );

void main() {
  final dio = MockDio();
  const categoryUid = 'any_uid';

  group('UpdateCategoryStore', () {
    test('Deve retornar um true ao atualizar uma categoria', () async {
      final store = makeStore(dio);
      when(() => dio.put('/categories/$categoryUid',
          data: any(named: 'data'), options: any(named: 'options'))).thenAnswer(
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

      store.setState(
        uid: categoryUid,
        name: 'any_name',
        description: 'any_description',
      );

      final result = await store.updateCategory();

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);
      expect(result, isTrue);
      expect(store.state, equals(CategoryBuilder.init().build()));
    });

    test(
        'Deve retornar um false e setar o failure com o erro ao atualizar uma categoria',
        () async {
      final store = makeStore(dio);
      when(() => dio.put('/categories/$categoryUid',
          data: any(named: 'data'), options: any(named: 'options'))).thenThrow(
        DioException(
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

      store.setState(
        uid: categoryUid,
        name: 'any_name',
        description: 'any_description',
      );

      final result = await store.updateCategory();

      expect(store.isLoading, isFalse);
      expect(store.failure, ServerFailure('Erro genérico'));
      expect(result, isFalse);
      expect(store.state, equals(CategoryBuilder.init().build()));
    });
  });
}
