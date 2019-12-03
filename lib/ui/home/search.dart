import 'package:dio/dio.dart';
import 'package:final_project_osg7/core/model/model_list_meals.dart';
import 'package:flutter/material.dart';

class SearchMealsScreen extends StatefulWidget {
  SearchMealsScreen({Key key}) : super(key: key);

  @override
  _SearchMealsState createState() => _SearchMealsState();
}

class _SearchMealsState extends State<SearchMealsScreen> {

  final TextEditingController _serachQuery = TextEditingController();
  final dio = Dio();
  final searchText = "";
  List<ModelListMeals> listMeals = List();
  List<ModelListMeals> filteredMeals = List();
  Icon searchIcon = Icon(Icons.search);
  Widget appBarTitle = Text('Search Meals');

    // Progress indicator widget to show loading.
  Widget loadingView() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Loading...'),
        )
      ],
    )
  );

  // View to empty data message
  Widget noDataView(String msg) => Center(
    child: Text(
      msg,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Meals'),
      ),
      
    );
  }
}