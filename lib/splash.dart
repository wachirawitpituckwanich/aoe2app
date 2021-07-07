import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';

//dependencies: splash
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: HomePage(),
        title: Text(
          'Age of Data',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
        photoSize: 100.0,
        loaderColor: Colors.blue);
  }
}
