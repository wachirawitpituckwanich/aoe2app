import 'package:aoe2app/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aoe2app/pages/leaderboard.dart';
import 'models/dataapi.dart';
import 'package:aoe2app/pages/splash.dart';
import 'package:aoe2app/pages/counter.dart';
import 'package:aoe2app/pages/about.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.grey),
    home: new SplashPage(),
  ));
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url))
    await launch(url);
  else
    // can't launch url, there is some error
    throw "Could not launch $url";
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> _welcome;
  @override
  void initState() {
    _welcome = ApiManager().getData();
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
                  '',
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
          title: Text("Age of data"),
        ),
        body: Container(
          child: FutureBuilder<Welcome>(
            future: _welcome,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.civilizations.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data.civilizations[index];
                    return Container(
                        height: 120,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Text(
                                    data.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data.armyType,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    data.civilizationBonus.join("\n"),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
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
