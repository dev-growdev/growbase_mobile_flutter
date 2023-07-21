abstract class AppConstants {
  static String baseUrl = 'http://localhost:8080/api';
  static String? token;
  static Map<String, String> get headerApi => {
        'authorization': 'Bearer $token',
      };
}
