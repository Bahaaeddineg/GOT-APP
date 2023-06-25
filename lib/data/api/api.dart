import 'dart:convert';

import 'package:http/http.dart';
import 'package:tvseries/constants/constants.dart';

class Api {
  Future<Map<String, dynamic>> getAllCharacters() async {
    Uri url = Uri.parse("${baseUrl}character");
    try {
      Response response = await get(url);

      return jsonDecode(response.body);
    } catch (e) {
      print("there is an error : $e");
      return {};
    }
  }
}
