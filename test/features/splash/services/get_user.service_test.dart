import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/splash/services/get_user.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:growbase_mobile_flutter/shared/entities/user_auth.entity.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final GetUserService sut = GetUserService(http);

  tearDown(() => reset(http));

  group('GetUserService -', () {
    final userData = {
      'token': 'your_token',
      'user': {
        'uid': 'any_uid',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
      },
    };
    test('deve chamar o método get do http para buscar o usuário autenticado',
        () async {
      when(() => http.get('/auth')).thenAnswer((_) async => {'data': userData});

      await sut.call();

      verify(() => http.get('/auth')).called(1);
    });

    test('Deve retornar o usuário autenticado após buscar', () async {
      when(() => http.get('/auth')).thenAnswer((_) async => {'data': userData});

      final result = await sut.call();

      expect(result, equals(UserAuth.fromMap(userData)));
    });
  });
}
