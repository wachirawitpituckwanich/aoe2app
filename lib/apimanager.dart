import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aoe2app/models/dataapi.dart';

class ApiManager {
  String dataUrl =
      'https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations';

  Future<Welcome> getData() async {
    var client = http.Client();
    var welcome;
    try {
      var response = await client.get(Uri.parse(dataUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        welcome = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return welcome;
    }

    return welcome;
  }
}
