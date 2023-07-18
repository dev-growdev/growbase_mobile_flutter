import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/categories/services/create_category.service.dart';
import 'package:growbase_mobile_flutter/features/categories/view/category/stores/create_category.store.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:growbase_mobile_flutter/shared/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

CreateCategoryStore makeStore(Dio dio) => CreateCategoryStore(
      CreateCategoryService(
        ApiAdapter(dio),
      ),
    );

void main() {
  final dio = MockDio();

  group('CreateCategoryStore', () {
    test('Deve retornar um true ao criar a categoria', () async {
      final store = makeStore(dio);
      when(() => dio.post('/categories',
          data: any(named: 'data'), options: any(named: 'options'))).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'success': true,
              'code': 200,
              'data': {
                'user': {
                  'uid': 'any_uid',
                  'name': 'any_name',
                  'description': 'any_description',
                }
              },
            },
            statusCode: 200,
          ),
        ),
      );

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);

      store.setState(name: 'any_name', description: 'any_description');

      final result = await store.createCategory();

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);
      expect(result, isTrue);
    });

    test(
        'Deve retornar um false e setar o failure com o erro ao criar a categoria',
        () async {
      final store = makeStore(dio);
      when(() => dio.post('/categories',
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

      store.setState(name: 'any_name', description: 'any_description');

      final result = await store.createCategory();

      expect(store.isLoading, isFalse);
      expect(store.failure, ServerFailure('Erro genérico'));
      expect(result, isFalse);
    });
  });
}
