import 'package:aoe2app/models/lb.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LbAPIManager {
  String dataUrl =
      'https://aoe2.net/api/leaderboard?game=aoe2de&leaderboard_id=3&start=1&count=100';

  Future<leaderboardaoe2> getData() async {
    var client = http.Client();
    var leaderboardlist ;
    try {
      var response = await client.get(Uri.parse(dataUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final jsonMap = json.decode(jsonString);
        leaderboardlist =leaderboardaoe2.fromJson(jsonMap);
      }
    } catch (Exception) {
      return leaderboardlist;
    }

    return leaderboardlist;
  }
}
