import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/login.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/shared/user.entity.builder.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final LoginService sut = LoginService(http);

  tearDown(() => reset(http));

  group('LoginService -', () {
    test('deve chamar o método post do http com as informações', () async {
      final data = {
        'login': 'any_login',
        'password': 'any_pass',
      };

      when(() => http.post('/signin', data)).thenAnswer(
        (_) async => {
          'data': {
            'user': {
              'uid': 'any_uid',
              'email': 'any_email',
              'name': 'any_name',
              'document': 'any_document',
            },
          },
        },
      );

      await sut.call(login: 'any_login', password: 'any_pass');

      verify(() => http.post('/signin', data)).called(1);
    });

    test('Deve retornar um User', () async {
      when(() => http.post(any(), any())).thenAnswer(
        (_) async => {
          'success': true,
          'code': 200,
          'data': {
            'user': {
              'uid': 'any_uid',
              'email': 'any_email',
              'name': 'any_name',
              'document': 'any_document',
            },
          },
        },
      );

      final result = await sut.call(login: 'any_login', password: 'any_pass');

      expect(result, UserBuilder.init().build());
    });
  });
}
