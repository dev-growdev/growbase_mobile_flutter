import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/create-account.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/features/authentication/create-account.dto.builder.dart';
import '../../../builders/shared/user.entity.builder.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final CreateAccountService sut = CreateAccountService(http);

  tearDown(() => reset(http));

  group('CreateAccountService -', () {
    final dto = CreateAccountDTOBuilder.init().build();

    test('deve chamar o método post do http com as informações', () async {
      when(() => http.post('/signup', dto.toMap())).thenAnswer(
        (_) async => {
          'data': {
            'uid': 'any_uid',
            'email': 'any_email',
            'name': 'any_name',
            'document': 'any_document',
          },
        },
      );

      await sut.call(dto);

      verify(() => http.post('/signup', dto.toMap())).called(1);
    });

    test('Deve retornar um User', () async {
      when(() => http.post(any(), any())).thenAnswer(
        (_) async => {
          'success': true,
          'code': 200,
          'data': {
            'uid': 'any_uid',
            'email': 'any_email',
            'name': 'any_name',
            'document': 'any_document',
          },
        },
      );

      final result = await sut.call(dto);

      expect(result, UserBuilder.init().build());
    });
  });
}
