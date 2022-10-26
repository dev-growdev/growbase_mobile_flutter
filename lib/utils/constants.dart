abstract class Constants {
  static String url = 'https://41fd-143-0-74-52.ngrok.io/api';
  static String? token;
  static Map<String, String> get headerApi => {
        'authorization': 'Bearer $token',
      };
}
