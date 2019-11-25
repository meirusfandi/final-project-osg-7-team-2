import 'package:flutter/material.dart';

class SearchMeals extends StatefulWidget {
  SearchMeals({Key key}) : super(key: key);

  @override
  _SearchMealsState createState() => _SearchMealsState();
}

class _SearchMealsState extends State<SearchMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Search Meals'),
       ),
    );
  }
}