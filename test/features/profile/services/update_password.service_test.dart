import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/profile/services/update_password.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final UpdatePasswordService sut = UpdatePasswordService(http);

  tearDown(() => reset(http));

  group('UpdatePasswordService -', () {
    const password = 'old_password';
    const newPassword = 'new_password';

    test('deve chamar o método put do http com a senha e a nova senha',
        () async {
      when(() => http.put('/account/update-password', {
            'password': password,
            'new_password': newPassword
          })).thenAnswer((_) async => {});

      await sut.call(password: password, newPassword: newPassword);

      verify(() => http.put('/account/update-password', {
            'password': password,
            'new_password': newPassword,
          })).called(1);
    });

    test('Deve retornar true ao atualizar a senha', () async {
      when(() => http.put(any(), any())).thenAnswer((_) async => {});

      final result = await sut.call(
        password: password,
        newPassword: newPassword,
      );

      expect(result, isTrue);
    });
  });
}
