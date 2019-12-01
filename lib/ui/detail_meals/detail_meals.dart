import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:final_project_osg7/core/network/service_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatefulWidget {
  String idMeals;
  String strMeals;
  DetailScreen({Key key, this.idMeals, this.strMeals}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

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

  ServiceDetails serviceDetails;
  Future<ModelMeals> meals;

  @override
  void initState() {
    serviceDetails = ServiceDetails();
    meals = serviceDetails.getDetails(widget.idMeals);
    super.initState();
  }
  
  // to swipe / pull refresh
  final GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  Meals meal = Meals();

  Future<Null> refresh() {
    return serviceDetails.getDetails(widget.idMeals).then((_meals) {
      setState(() => meal = _meals as Meals);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.strMeals
        ),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refresh,
        child: FutureBuilder<ModelMeals>(
          future: serviceDetails.getDetails(widget.idMeals),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: {
                return loadingView();
              }
              case ConnectionState.active: {
                break;
              }
              case ConnectionState.none: {
                return noDataView('Something went wrong');
              }
              case ConnectionState.done: {
                if (snapshot.hasData) {
                  if (snapshot.data.meals != null) {
                    if (snapshot.data.meals.length == 1) {
                      var mealData = snapshot.data.meals[0];
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    child: Image.network(
                                      mealData.strMealsThumb,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      height: 300,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.7),
                                    width: MediaQuery.of(context).size.height,
                                    height: 60,
                                    child: Center(
                                      child: Text(
                                        mealData.strMeals,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28.0
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.place,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    mealData.strArea,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )
                            ),
                            
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                bottom: 8.0
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.category,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  Text(
                                    mealData.strCategory,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                bottom: 8.0
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.tag,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    mealData.strTags,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),

                            Divider(),

                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 32,
                                    ),
                                    Text(
                                      '100K'
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.share,
                                      color: Colors.blue,
                                      size: 32,
                                    ),
                                    Text(
                                      '50K'
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.comment,
                                      color: Colors.green,
                                      size: 32,
                                    ),
                                    Text(
                                      '10M'
                                    )
                                  ],
                                ),
                              ],
                            ),

                            Divider(),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                mealData.strMealsInstructions,
                                style: TextStyle(
                                  fontSize: 16,
                                )
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return noDataView('Data not found or data is list.');
                    }
                  } else {
                    return noDataView('No data found.');
                  }
                } else if (snapshot.hasError){
                  return Container(child: Text(snapshot.error));
                } else {
                  return noDataView('No data and no error');
                }
                break;
              }
              default: {
                return noDataView('Something went wrong!');
              }
            }
          },
        ),
      )
    );
  }
}