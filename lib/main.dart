import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vdart/onboardingscreen/onboardingui.dart';
import 'package:vdart/screens/home/home.dart';

import 'package:vdart/utils.dart/styles.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grove one',
      color: Colors.white,
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) =>
            new Home(), //Redirect to homepage
        '/WelcomePage': (BuildContext context) =>
            new OnboardingScreen(), //Redirect to loginpage
      },
    );
  }
}

//creation of Splashscreen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//Initialize startTime() for predict duration limit.
  startTime() async {
    SharedPreferences vdart = await SharedPreferences.getInstance();
    // vdart.clear();
    bool firstTime = vdart.getBool('first_time');

    var _duration = new Duration(seconds: 1);
    if (firstTime != null && !firstTime) {
      // Not first time
      return new Timer(_duration, navigationPageHome);
    } else {
      // First time

      return new Timer(_duration, navigationPageWel);
    }
  }

  void navigationPageHome() {
    //Navigate to Homepage(not first time)
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  void navigationPageWel() {
    //Navigate to LoginPage (first time)
    Navigator.of(context).pushReplacementNamed('/WelcomePage');
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    //Find current device size
    Size screenSize = MediaQuery.of(context).size;
    double wt = screenSize.width; //width

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.deepPurple[500],
            /*  decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Theme.Colors.loginGradientStart,
                    Theme.Colors.loginGradientEnd
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),*/
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Grove One', style: ts.copyWith(fontSize: wt / 13)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
