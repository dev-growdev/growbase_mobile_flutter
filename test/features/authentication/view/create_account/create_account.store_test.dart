import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/create_account.service.dart';
import 'package:growbase_mobile_flutter/features/authentication/view/create_account/create_account.store.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:growbase_mobile_flutter/shared/errors/failures.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

CreateAccountStore makeStore(Dio dio) => CreateAccountStore(
      CreateAccountService(
        ApiAdapter(dio),
      ),
    );

void main() {
  final dio = MockDio();

  group('CreateAccountStore', () {
    test('Deve retornar um true ao criar a conta', () async {
      final store = makeStore(dio);
      when(() => dio.post('/signup',
          data: any(named: 'data'), options: any(named: 'options'))).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'success': true,
              'code': 200,
              'data': {
                'uid': 'any_uid',
                'email': 'any_email',
                'name': 'any_name',
                'document': 'any_document',
              },
            },
            statusCode: 200,
          ),
        ),
      );

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);

      store.setName('any_name');
      store.setEmail('any_email');
      store.setDocument('any_document');
      store.setPassword('any_pass');

      final result = await store.createAccount();

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);
      expect(result, isTrue);
    });

    test('Deve retornar um false e setar o failure com o erro ao criar a conta',
        () async {
      final store = makeStore(dio);
      when(() => dio.post('/signup',
          data: any(named: 'data'), options: any(named: 'options'))).thenThrow(
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

      store.setName('any_name');
      store.setEmail('any_email');
      store.setDocument('any_document');
      store.setPassword('any_pass');

      final result = await store.createAccount();

      expect(store.isLoading, isFalse);
      expect(store.failure, ServerFailure('Erro genérico'));
      expect(result, isFalse);
    });
  });
}
