import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/recovery_password.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final RecoveryPasswordService sut = RecoveryPasswordService(http);

  tearDown(() => reset(http));

  group('RecoveryPasswordService -', () {
    const login = 'test@example.com';
    test('deve chamar o método post do http com o email', () async {
      when(() => http.post('/account/reset-password', {'email': login}))
          .thenAnswer((_) async => {});

      await sut.call(login);

      verify(() => http.post('/account/reset-password', {'email': login}))
          .called(1);
    });

    test('Deve retornar true ao fazer a solicitação de recuperação', () async {
      when(() => http.post(any(), any())).thenAnswer((_) async => {});

      final result = await sut.call(login);

      expect(result, isTrue);
    });
  });
}
