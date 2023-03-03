import '../../../shared/adapters/api.adapter.dart';

class GetTermsAndPolicyService {
  final IHttpAdapter _http;

  const GetTermsAndPolicyService(this._http);

  Future<String> call(String title) async {
    final response = await _http.get(
      '/terms',
      queryParameters: {
        'title': title,
      },
    );

    return response['data']['content'];
  }
}
