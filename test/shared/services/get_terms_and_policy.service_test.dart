import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:growbase_mobile_flutter/shared/services/get_terms_and_policy.service.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final GetTermsAndPolicyService sut = GetTermsAndPolicyService(http);

  tearDown(() => reset(http));

  group('GetTermsAndPolicyService -', () {
    const title = 'terms';

    test('deve chamar o método get do http para buscar os termos', () async {
      when(() => http.get('/terms', queryParameters: {'title': title}))
          .thenAnswer((_) async => {
                'data': {'content': 'Termos e Condições'}
              });

      await sut.call(title);

      verify(() => http.get('/terms', queryParameters: {'title': title}))
          .called(1);
    });

    test('Deve retornar o conteúdo dos termos após buscar', () async {
      const termsContent = 'Termos e Condições';
      when(() =>
              http.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => {
                'data': {'content': termsContent}
              });

      final result = await sut.call(title);

      expect(result, equals(termsContent));
    });
  });
}
