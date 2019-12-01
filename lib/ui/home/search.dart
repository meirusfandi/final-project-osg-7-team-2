import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:final_project_osg7/core/network/service_search.dart';
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
  Meals _meals;
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
  
  // ServiceSearch _serviceSearch;

  void init() {
    // _serviceSearch.getSearchMeals(_searchText).then((meals) {
    //   setState(() => _meals = meals as Meals);
    // });
  }

  Future<Null> _refresh() {
    // return _serviceSearch.getSearchMeals(_searchText).then((meals) {
    //   setState(() => _meals = meals as Meals);
    // });
  }

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

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(icon: actionIcon, onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close, color: Colors.white,);
                this.appBarTitle = new TextField(
                  // controller: _searchQuery,
                  style: new TextStyle(
                    color: Colors.white,

                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
                );
                _handleSearchStart();
              }
              else {
                _handleSearchEnd();
              }
            });
          },),
        ]
    );
  }

  // List<ChildItem> _buildList() {
  //   return widget(child: ChildItem(idMeals: _meals.idMeals, strThumb: _meals.strMealsThumb, strInstructions: _meals.strMealsInstructions));
  // }

  // List<ChildItem> _buildSearchList() {
  //   if (_searchText.isEmpty) {
  //     return _list.map((contact) => new ChildItem(contact))
  //         .toList();
  //   }
  //   else {
  //     List<String> _searchList = List();
  //     for (int i = 0; i < _list.length; i++) {
  //       String  name = _list.elementAt(i);
  //       if (name.toLowerCase().contains(_searchText.toLowerCase())) {
  //         _searchList.add(name);
  //       }
  //     }
  //     return _searchList.map((contact) => new ChildItem(contact))
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Search Meals'),
      ),
      body: RefreshIndicator(
        key: _refreshKey,
        onRefresh: _refresh,
        child: FutureBuilder<ModelMeals>(),
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