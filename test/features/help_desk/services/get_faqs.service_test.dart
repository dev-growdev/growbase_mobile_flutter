import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/help_desk/entities/faq.entity.dart';
import 'package:growbase_mobile_flutter/features/help_desk/services/get_faqs.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final GetFaqsService sut = GetFaqsService(http);

  tearDown(() => reset(http));

  group('GetFaqsService -', () {
    test('Ceve chamar o método get do http para buscar as FAQs', () async {
      when(() => http.get('/faqs')).thenAnswer((_) async => {'data': []});

      await sut.call();

      verify(() => http.get('/faqs')).called(1);
    });

    test('Deve retornar uma lista de FAQs após buscar', () async {
      final mockFaqs = [
        {'question': 'Pergunta 1', 'answer': 'Resposta 1'},
        {'question': 'Pergunta 2', 'answer': 'Resposta 2'},
      ];

      when(() => http.get(any())).thenAnswer((_) async => {'data': mockFaqs});

      final result = await sut.call();

      final expectedFaqs = mockFaqs.map((data) => Faq.fromMap(data)).toList();

      expect(result, equals(expectedFaqs));
    });
  });
}
