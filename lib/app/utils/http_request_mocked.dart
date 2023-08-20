import 'package:flutter/services.dart';

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

  static loadJsonData() async{
    return await rootBundle.loadString('assets/questions/questions.json');              
  }
}