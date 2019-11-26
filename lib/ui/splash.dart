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

    Duration duration = Duration(seconds: 1);

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
       body: Center(
         child: CircularProgressIndicator(),
       ),
    );
  }
}