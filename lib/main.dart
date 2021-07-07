import 'package:aoe2app/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/dataapi.dart';
import 'splash.dart';

void main() {
  runApp(new MaterialApp(
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
    _welcome = API_Manager().getData();
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
                 child:
                    Text('Age of Data', style: TextStyle(color: Colors.white,),),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                     fit: BoxFit.contain)
              ),
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
                title: Text('Buy Age of Empires 2: Definitive Edition'),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.pop(context);
                  _launchURL("https://store.steampowered.com/app/813780/Age_of_Empires_II_Definitive_Edition/");
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
                            Card(),
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

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:
                    Text('Age of Data', style: TextStyle(color: Colors.white,),),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                     fit: BoxFit.contain)
              ),
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
                title: Text('Buy Age of Empires 2: Definitive Edition'),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.pop(context);
                  _launchURL("https://store.steampowered.com/app/813780/Age_of_Empires_II_Definitive_Edition/");
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
