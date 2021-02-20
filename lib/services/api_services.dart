import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:numerical_lotto/constant.dart';

//Json convert to List<int>
List<int> numberFromJson(String str) =>
    List<int>.from(json.decode(str).map((x) => x));

class ApiServices {
  Future<List<int>> getNumbers() async {
    http.Response response = await http.get(baseUrl + 'api/numbers');
    if (response.statusCode == 200) {
      return numberFromJson(response.body);
    } else {
      throw Exception("Bağlanılamadı bekleniliyor....");
    }
  }
}
