import 'dart:convert';
import 'package:http/http.dart';
import '../../constants/endpoints.dart';

//characters
class Api {
  Future<List> getAllCharacters() async {
    Uri url = Uri.parse("${baseUrl}Characters");
    try {
      Response response = await get(url);

      return jsonDecode(response.body);
    } catch (e) {
      print("there is an error : $e");
      return [];
    }
  }

  Future<List> getAllQuotes() async {
    Uri url = Uri.parse("${quotBaseUrl}characters");
    try {
      Response response = await get(url);
      return jsonDecode(response.body);
    } catch (e) {
      return [];
    }
  }
}
