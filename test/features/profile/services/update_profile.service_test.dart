import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/profile/services/update_profile.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/shared/user.entity.builder.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final UpdateProfileService sut = UpdateProfileService(http);

  tearDown(() => reset(http));

  group('UpdateProfileService -', () {
    final user = UserBuilder.init().build();

    test('deve chamar o método put do http com os dados do perfil', () async {
      when(() => http.put('/account/profile/', user.toMap()))
          .thenAnswer((_) async => {});

      await sut.call(user);

      verify(() => http.put('/account/profile/', user.toMap())).called(1);
    });

    test('Deve retornar true ao atualizar o perfil', () async {
      when(() => http.put(any(), any())).thenAnswer((_) async => {});

      final result = await sut.call(user);

      expect(result, isTrue);
    });
  });
}
