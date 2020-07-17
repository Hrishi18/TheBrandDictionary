import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {   
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MyHomePage(),

      ));

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'The Brand Dictionary',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Check before you buy!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
