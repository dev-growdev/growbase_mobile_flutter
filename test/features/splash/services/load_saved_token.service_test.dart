import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/splash/services/load_saved_token.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/shared_preference.adapter.dart';
import 'package:growbase_mobile_flutter/utils/constants/app.constants.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorage extends Mock implements ILocalStorage {}

void main() {
  final ILocalStorage localStorage = MockLocalStorage();
  final LoadSavedTokenService sut = LoadSavedTokenService(localStorage);

  tearDown(() => reset(localStorage));

  group('LoadSavedTokenService -', () {
    const savedToken = 'your_saved_token';

    test(
        'deve chamar o método getValue do ILocalStorage para buscar o token salvo',
        () async {
      when(() => localStorage.getValue('userLogged'))
          .thenAnswer((_) async => savedToken);

      await sut.call();

      verify(() => localStorage.getValue('userLogged')).called(1);
    });

    test(
        'Deve armazenar o token em AppConstants.token e retornar o token salvo',
        () async {
      when(() => localStorage.getValue(any()))
          .thenAnswer((_) async => savedToken);

      final result = await sut.call();

      expect(AppConstants.token, equals(savedToken));
      expect(result, equals(savedToken));
    });
  });
}
