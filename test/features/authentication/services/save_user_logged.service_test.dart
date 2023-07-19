import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/authentication/services/save_user_logged.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/shared_preference.adapter.dart';
import 'package:growbase_mobile_flutter/shared/view/stores/app.store.dart';
import 'package:growbase_mobile_flutter/utils/constants/app.constants.dart';
import 'package:mocktail/mocktail.dart';

import '../../../builders/shared/user_auth.entity.builder.dart';

class MockLocalStorage extends Mock implements ILocalStorage {}

class MockAppStore extends Mock implements AppStore {}

void main() {
  final ILocalStorage localStorage = MockLocalStorage();
  final AppStore appStore = MockAppStore();
  final SaveUserLoggedService sut =
      SaveUserLoggedService(localStorage: localStorage, appStore: appStore);

  tearDown(() {
    reset(appStore);
    reset(localStorage);
  });

  group('SaveUserLoggedService -', () {
    final userAuth = UserAuthBuilder.init().build();

    test('deve salvar o token no armazenamento local', () async {
      when(() => localStorage.setValue('userLogged', userAuth.token))
          .thenAnswer((_) async => true);

      await sut.call(userAuth);

      verify(() => localStorage.setValue('userLogged', userAuth.token))
          .called(1);
    });

    test('deve adicionar o usuário ao AppStore', () async {
      when(() => localStorage.setValue('userLogged', userAuth.token))
          .thenAnswer((_) async => true);
      when(() => appStore.addUser(userAuth.user)).thenAnswer((_) {});

      await sut.call(userAuth);

      verify(() => appStore.addUser(userAuth.user)).called(1);
    });

    test('deve definir o token nos AppConstants', () async {
      when(() => localStorage.setValue('userLogged', userAuth.token))
          .thenAnswer((_) async => true);
      when(() => appStore.addUser(userAuth.user)).thenAnswer((_) {});

      await sut.call(userAuth);

      expect(AppConstants.token, userAuth.token);
    });

    test('deve retornar true ao salvar o usuário logado', () async {
      when(() => localStorage.setValue('userLogged', userAuth.token))
          .thenAnswer((_) async => true);
      when(() => appStore.addUser(userAuth.user)).thenAnswer((_) {});

      final result = await sut.call(userAuth);

      expect(result, isTrue);
    });
  });
}
