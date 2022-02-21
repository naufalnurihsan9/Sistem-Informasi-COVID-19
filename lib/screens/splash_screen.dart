import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/main.dart';
import 'package:flutter_covid_dashboard_ui/screens/bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => BottomNavScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Container(
      width: width * 0.6,
      height: width * 0.6,
      child: Image.asset(
        "assets/images/covid_logo.png",
        fit: BoxFit.contain,
      ),
    )));
  }
}
