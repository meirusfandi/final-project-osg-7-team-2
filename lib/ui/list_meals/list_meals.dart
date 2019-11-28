import 'package:final_project_osg7/core/model/model_list_meals.dart';
import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:final_project_osg7/core/network/service_meals.dart';
import 'package:flutter/material.dart';

class ListMeals extends StatefulWidget {
  final String category;

  ListMeals({Key key, this.category}) : super(key: key);
  
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<ListMeals> {

  ServiceMeals _serviceMeals;

  @override
  void initState() {
    _serviceMeals = ServiceMeals();
  }

  // Progress indicator widget to show loading.
  Widget loadingView() => Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.red,
    ),
  );

  // View to empty data message
  Widget noDataView(String msg) => Center(
    child: Text(
      msg,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
    ),
  );
  
  // to swipe / pull refresh
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();

  ListMeals meals = ListMeals();

  Future<Null> _refresh() {
    return _serviceMeals.getMeals(widget.category).then((_meals) {
      setState(() => meals = _meals as ListMeals);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.category),
       ),
       body: RefreshIndicator(
         key: _refreshKey,
         onRefresh: _refresh,
         child: FutureBuilder<ModelListMeals>(
          future: _serviceMeals.getMeals(widget.category),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: {
                return loadingView();
              }
              case ConnectionState.active: {
                break;
              }
              case ConnectionState.done: {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2
                      ),
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.meals.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data.meals[index];
                        return snapshot.data.meals == null
                            ? Text("No Meals found.")
                            : InkWell(
                          child: Card(
                            margin: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    child: Image.network(
                                      data.strMealsThumb,
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 40,
                                    color: Colors.grey.withOpacity(0.7),
                                    width: MediaQuery.of(context).size.height,
                                    child: Center(
                                      child: Text(
                                        data.strMeals,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            ),
                          ),
                          onTap: () {
                            // Route route = MaterialPageRoute(
                            //   builder: (context) => ListMeals()
                            // );
                            // Navigator.push(context, route);
                          },
                        );
                      }
                  );
                } else {
                  return noDataView('No data found.');
                }
                break;
              }
              case ConnectionState.none: {
                break;
              }
            }
          },
        ),
       ),
    );
  }
}