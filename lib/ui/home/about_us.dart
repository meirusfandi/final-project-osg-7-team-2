import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('About Us'),
       ),
       body: SingleChildScrollView(
         child: Column(
           mainAxisSize: MainAxisSize.max,
           children: <Widget>[
             
           ],
         ),
       ),
    );
  }
}