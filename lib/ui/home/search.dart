import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:final_project_osg7/ui/detail_meals/detail_meals.dart';
import 'package:flutter/material.dart';

class SearchMealsScreen extends StatefulWidget {
  SearchMealsScreen({Key key}) : super(key: key);

  @override
  _SearchMealsState createState() => _SearchMealsState();
}

class _SearchMealsState extends State<SearchMealsScreen> {

  Widget appBarTitle = Text(
    'Search Meals ...', 
    style: TextStyle(
      color: Colors.white
    ),
  );

  Icon actionIcon = Icon(
    Icons.search, 
    color: Colors.white
  );

  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _serachQuery = TextEditingController();
  List<Meals> _meals;
  bool _isSearching;
  String _searchText = "";

  _SearchMealsState() {
    _serachQuery.addListener(() {
      if (_serachQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _serachQuery.text;
        });
      }
    });
  }
  
  @override
  void initState() { 
    super.initState();
    
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search, 
        color: Colors.white
      );

      this.appBarTitle = Text(
        'Search Meals ...',
        style: TextStyle(
          color: Colors.white
        ),
      );
      _isSearching = true;
      _serachQuery.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Search Meals'),
       ),

    );
  }
}

class ChildItem extends StatelessWidget {
  final String strMeals;
  final String idMeals;
  final String strThumb;
  final String strInstructions;

  const ChildItem({Key key, 
    this.strMeals, 
    this.idMeals, 
    this.strThumb,
    this.strInstructions
    }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Image.network(this.strThumb),
      title: Text(
        this.strMeals,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
      subtitle: Text(
        this.strInstructions,
        style: TextStyle(
          fontSize: 14,
        )
      ),
      onTap: () {
        Route route = MaterialPageRoute(
          builder: (context) => DetailScreen(idMeals: this.idMeals, strMeals: this.strMeals)
        );
        Navigator.push(context, route);
      },
    );
  }
}