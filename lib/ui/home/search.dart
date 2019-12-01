import 'package:final_project_osg7/core/model/model_list_meals.dart';
import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:final_project_osg7/core/network/service_search.dart';
import 'package:final_project_osg7/ui/detail_meals/detail_meals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchMealsScreen extends StatefulWidget {
  SearchMealsScreen({Key key}) : super(key: key);

  @override
  _SearchMealsState createState() => _SearchMealsState();
}

class _SearchMealsState extends State<SearchMealsScreen> {

  final TextEditingController _serachQuery = TextEditingController();
  
  ServiceSearch _serviceSearch;

  ListMeals _meals;

  // void init() {
  //   _serviceSearch.getSearchMeals(_searchText).then((meals) {
  //     setState(() => _meals = meals as ListMeals);
  //   });
  // }

  // Future<Null> _refresh() {
  //   return _serviceSearch.getSearchMeals(_searchText).then((meals) {
  //     setState(() => _meals = meals as ListMeals);
  //   });
  // }

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

  Future<Meals> _listmeals;

  // to swipe / pull refresh
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() { 
    // _serviceSearch = ServiceSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Meals'),
      ),
      body: RefreshIndicator(
        key: _refreshKey,
        // onRefresh: _refresh,
        child: FutureBuilder<ModelMeals>(),
      ),
    );
  }

  Widget _buildTextField(List listMeals) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        autofocus: false,
        controller: _serachQuery,
        style: TextStyle(
          color: Colors.black26,
          fontSize: 18
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Search title meals",
          labelStyle: TextStyle(
            color: Colors.black12
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)
          )
        )
      ),
      suggestionsCallback: (String query) {
        // ModelListMeals list = _serviceSearch.getSearchMeals(query);
        // return ;
      },
      onSuggestionSelected: (ListMeals meals) {
        setState(() {
          this._meals = meals;
        });
        _serachQuery.text = meals.strMeals;
      },

      noItemsFoundBuilder: (context) {
        return ListTile(
          title: Text(
            'Meals not found.'
          ),
        );
      },

      itemBuilder: (context, ListMeals meals) {
        return ListTile(
          title: Text(
            meals.strMeals
          ),
          leading: Image.network(meals.strMealsThumb),
        );
      },
    );
  }
}