import 'package:aoe2app/pages/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aoe2app/main.dart';
import 'about.dart';
class Counter extends StatelessWidget {
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
                title: Text('Data'),
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
                title: Text('Leaderboard'),
                leading: Icon(Icons.leaderboard_sharp),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LeaderboardPg()),
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
        appBar: AppBar(title: Text("Unit counters")),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 25),
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                  //ROW 2
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                          "In Age of Empires II, There are three vital units that players often face in the battlefield - Hussars (fully upgraded scouts), Elite Skirmishers, and Halbediers (fully upgraded spearmen)."),
                    )
                  ]),
              Row(
                  //ROW 3
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/Hussar.png"),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/Eskirmisher.png"),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/Halberdier.png"),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ]),
              Row(
                  //ROW 4
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          "From left to right, Hussars, Elite Skirmishers and Halberdiers",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w100)),
                    )
                  ]),
              Row(
                  //ROW 4
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                          "These are called trash units. They are trash because they are easy to kill, however, they require no gold to produce and they counter many units that need gold to be made."),
                    )
                  ]),
                  Row(
                  //ROW 4
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                          "Trash units counter each other similiar to Rock-Paper-Scrissor Cycle which can be depict as follows"),
                    )
                  ]),
              Row(
                  //ROW 4
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child:
                      Container(
                              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                              width: 400,
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/aoe2uc.png"),
                                ),
                              ),
                            ),
                    )
                  ]),
            ],
          ),
        ));
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url))
    await launch(url);
  else
    // can't launch url, there is some error
    throw "Could not launch $url";
}
