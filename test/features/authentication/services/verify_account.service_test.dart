import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/verify_account.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final VerifyAccountService sut = VerifyAccountService(http);

  tearDown(() => reset(http));

  group('VerifyAccountService -', () {
    const login = 'test@example.com';
    const code = '123456';

    test('deve chamar o método post do http com o email e código', () async {
      when(() => http.post('/verify-account', {'email': login, 'code': code}))
          .thenAnswer((_) async => {});

      await sut.call(login: login, code: code);

      verify(() => http.post('/verify-account', {'email': login, 'code': code}))
          .called(1);
    });

    test('Deve retornar true ao verificar a conta', () async {
      when(() => http.post(any(), any())).thenAnswer((_) async => {});

      final result = await sut.call(login: login, code: code);

      expect(result, isTrue);
    });
  });
}
