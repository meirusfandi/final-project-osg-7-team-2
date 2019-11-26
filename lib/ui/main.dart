import 'package:final_project_osg7/ui/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}