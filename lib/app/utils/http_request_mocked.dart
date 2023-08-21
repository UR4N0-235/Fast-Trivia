import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class HttpRequestMocked {
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

    return response.data;
  }
}
