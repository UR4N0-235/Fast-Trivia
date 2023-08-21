import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class HttpRequestMocked {
  // TODO: implement mock http
  // static Future<String> loadJsonData() async {
  //   final response = await http.get(Uri.parse('assets/questions.json'));
  //   if (response.statusCode == 200) {
  //       return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load JSON');
  //   }
  // }

  static Future<String> loadJsonData() async {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    const path = 'https://example.com';

    final mockedResponse = await rootBundle
        .loadString('assets/questionaries/all_questionaries.json');

    dioAdapter.onGet(
      path,
      (server) => server.reply(
        200,
        mockedResponse,
        delay: const Duration(seconds: 1),
      ),
    );

    final response = await dio.get(path);

    print(response.data); // {message: Success!}
    return response.data;
  }
}
