import 'package:aoe2app/pages/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:aoe2app/main.dart';
import 'counter.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  ''
                ),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain)),
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
                title: Text('Unit counters'),
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
        appBar: AppBar(title: Text("About")),
        body: new Container(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //ROW 1
                children: [
                  Container(
                      child: Text("Age of Data",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30))),
                ],
              ),
              Row(
                  //ROW 2
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text("Version: 1.0.0"),
                    )
                  ]),
              Row(
                  //ROW 3
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child:
                          Text("Created and tested by Wachirawit Pituckwanich"),
                    )
                  ]),
              Row(
                  //ROW 4
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("API was provided by public-api"),
                    )
                  ]),
              Row(
                  //ROW 4
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          "This application is not affiliated with \nAge of Empires II©. all info and materials are belong to \nit's original owners."),
                    )
                  ]),
              Row(
                  //ROW 4
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Icons are provided by svgrepo.com"),
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
