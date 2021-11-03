import 'package:aoe2app/main.dart';
import 'package:aoe2app/models/lb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../lbapimanager.dart';
import 'about.dart';
import 'counter.dart';
import 'package:aoe2app/lbapimanager.dart';



Future<void> _launchURL(String url) async {
  if (await canLaunch(url))
    await launch(url);
  else
    // can't launch url, there is some error
    throw "Could not launch $url";
}

class LeaderboardPg extends StatefulWidget {
  @override
  _LeaderboardPgState createState() => _LeaderboardPgState();
}

class _LeaderboardPgState extends State<LeaderboardPg> {
  Future<Leaderboardaoe2> _leaderboard;
  @override
  void initState() {
    _leaderboard = LbAPIManager().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  ''
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain)),
              ),
              ListTile(
                title: Text('About'),
                leading: Icon(Icons.info),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
              ListTile(
                title: Text('Civilization data'),
                leading: Icon(Icons.insert_chart),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              ListTile(
                title: Text('Unit Counters'),
                leading: Icon(Icons.accessibility),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Counter()),
                  );
                },
              ),
              ListTile(
                title: Text('Buy Age of Empires 2: Definitive Edition'),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.pop(context);
                  _launchURL(
                      "https://store.steampowered.com/app/813780/Age_of_Empires_II_Definitive_Edition/");
                },
              ),
              ListTile(
                title: Text('Exit'),
                leading: Icon(Icons.power_settings_new),
                onTap: () {
                  Navigator.pop(context);
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Leaderboard"),
          elevation: 0.0,
        ),
        body: Container(
          child: FutureBuilder<Leaderboardaoe2>(
            future: _leaderboard,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.leaderboard.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data.leaderboard[index];
                    var rating = data.rating.toString();
                    var rank = data.rank.toString();
                    var highestRating = data.highestRating.toString();
                    var wins = data.wins.toString();
                    var games = data.games.toString();
                    return Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: 
                                        Text(
                                        rank,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start ,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                                        child: Text(
                                          data.name,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                                          child: Text(
                                            "Rating: $rating",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                                        child: Text(
                                          "Highest Rating: $highestRating",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                                        child: Text(
                                          "Wins: $wins",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                                        child: Text(
                                          "Games: $games",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ]))
                          ],
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
