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
  
  // to swipe / pull refresh
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();

  Meals meals = Meals();

  Future<Null> _refresh() {
    return _serviceMeals.getMeals(widget.category).then((_meals) {
      setState(() => meals = _meals as Meals);
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
         child: FutureBuilder<ModelMeals>(
          future: _serviceMeals.getMeals(widget.category),
          builder: (context, snapshot) {
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
                        ? Text("No categories found.")
                        : InkWell(
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Image.network(
                                  data.strMealsThumb
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Text(
                                data.strMeals,
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
                                data.strMealsInstructions,
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
                        // Route route = MaterialPageRoute(
                        //   builder: (context) => ListMeals()
                        // );
                        // Navigator.push(context, route);
                      },
                    );
                  }
              );
            }
          },
        ),
       ),
    );
  }
}