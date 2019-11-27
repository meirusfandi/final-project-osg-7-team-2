import 'package:flutter/material.dart';

class SearchMealsScreen extends StatefulWidget {
  SearchMealsScreen({Key key}) : super(key: key);

  @override
  _SearchMealsState createState() => _SearchMealsState();
}

class _SearchMealsState extends State<SearchMealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Search Meals'),
       ),
    );
  }
}