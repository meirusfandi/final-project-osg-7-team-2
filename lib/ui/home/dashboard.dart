import 'package:final_project_osg7/core/model/model_categories.dart';
import 'package:final_project_osg7/core/network/service_categories.dart';
import 'package:final_project_osg7/ui/list_meals/list_meals.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {

  ServiceCategories _serviceCategories;

  Future<ModelCategories> categories;

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

  @override
  void initState() {
    _serviceCategories = ServiceCategories();
    super.initState();
  }
  
  // to swipe / pull refresh
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();

  Categories category = Categories();

  Future<Null> _refresh() {
    return _serviceCategories.getCategories().then((_categories) {
      setState(() => category = _categories as Categories);
    });
  }
  
  String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Dashboard'),
       ),
       body: RefreshIndicator(
         key: _refreshKey,
         onRefresh: _refresh,
         child: FutureBuilder<ModelCategories>(
          future: _serviceCategories.getCategories(),
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
                  if (snapshot.data.categories != null) {
                    if (snapshot.data.categories.length > 0) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.categories.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data.categories[index];
                          return snapshot.data.categories == null
                              ? Text("No categories found.")
                              : InkWell(
                            child: Card(
                              margin: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Center(
                                    child: Image.network(
                                        data.strCategoryThumb
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 8.0,
                                      left: 8.0,
                                      right: 8.0,
                                    ),
                                    child: Text(
                                      data.strCategory,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        bottom: 8.0
                                    ),
                                    child: Text(
                                      data.strCategoryDescription,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              showToast(data.strCategory+" clicked");
                              // categoryName = data.strCategory;
                              
                              // Route route = MaterialPageRoute(
                              //   builder: (context) => ListMeals(category: categoryName)
                              // );
                              // Navigator.push(context, route);
                            },
                          );
                        }
                    );
                    } else {
                      return noDataView('No data found.');
                    }
                  } else {
                    return noDataView('No data found.');
                  }
                } else if (snapshot.hasError) {
                  return noDataView('Something went wrong');
                } else {
                  return noDataView('Something went wrong');
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

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}