import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {

  Future<http.Response> get(String url) async {
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-Auth-Token': dotenv.env['FOOTBALL_DATA_API_TOKEN'] ?? '',
      },
    );
    return response;
  }
}