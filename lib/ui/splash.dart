import 'dart:async';

import 'package:final_project_osg7/core/local/helper/database_helper.dart';
import 'package:final_project_osg7/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    // create db
    DatabaseHelper.createDB();

    Duration duration = Duration(seconds: 3);

    Route route = MaterialPageRoute(
      builder: (context) => HomeScreen()
    );

    Timer(
      duration, 
      () {
        Navigator.pushReplacement(context, route);
      }
    );

    return Scaffold(
       body: Container(
         child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Image.asset(
                      'assets/image_splash_screen.png',
                      width: double.infinity,
                    ),
                  ),
                  CircularProgressIndicator(),
                ],
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text(
                  'App Version 1.0.0'
                )
              ),
            ),
          ],
        ),
       ),
    );
  }
}