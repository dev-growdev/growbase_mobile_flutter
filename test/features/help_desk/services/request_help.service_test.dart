import 'package:flutter_test/flutter_test.dart';
import 'package:growbase_mobile_flutter/features/help_desk/services/request_help.service.dart';
import 'package:growbase_mobile_flutter/shared/adapters/api.adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpAdapter {}

void main() {
  final IHttpAdapter http = MockHttpClient();
  final RequestHelpService sut = RequestHelpService(http);

  tearDown(() => reset(http));

  group('RequestHelpService -', () {
    const question = 'How can I use this feature?';

    test('deve chamar o método post do http com a pergunta', () async {
      when(() => http.post('/help', {'question': question}))
          .thenAnswer((_) async => {});

      await sut.call(question);

      verify(() => http.post('/help', {'question': question})).called(1);
    });
  });
}
