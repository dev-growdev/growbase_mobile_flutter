import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/login.service.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/save_user_logged.service.dart';
import 'package:growbase_mobile_flutter/features/authentication/view/login/login.store.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:growbase_mobile_flutter/shared/adapters/shared_preference.adapter.dart';
import 'package:growbase_mobile_flutter/shared/errors/failures.dart';
import 'package:growbase_mobile_flutter/shared/view/stores/app.store.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

LoginStore makeStore(Dio dio) => LoginStore(
      loginService: LoginService(
        ApiAdapter(dio),
      ),
      saveUserLoggedService: SaveUserLoggedService(
        localStorage: SharedPreferenceStorage(),
        appStore: AppStore(),
      ),
    );

void main() {
  final dio = MockDio();

  group('LoginStore', () {
    test('Deve retornar um true ao logar', () async {
      final store = makeStore(dio);
      when(() => dio.post('/signin',
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
                  'email': 'any_email',
                  'name': 'any_name',
                  'document': 'any_document',
                }
              },
            },
            statusCode: 200,
          ),
        ),
      );

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);

      store.setLogin('any_login');
      store.setPass('any_pass');

      final result = await store.signIn();

      expect(store.isLoading, isFalse);
      expect(store.failure, isNull);
      expect(result, isTrue);
    });

    test('Deve retornar um false e setar o failure com o erro ao criar a conta',
        () async {
      final store = makeStore(dio);
      when(() => dio.post('/signin',
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

      store.setLogin('any_login');
      store.setPass('any_pass');

      final result = await store.signIn();

      expect(store.isLoading, isFalse);
      expect(store.failure, ServerFailure('Erro genérico'));
      expect(result, isFalse);
    });
  });
}
