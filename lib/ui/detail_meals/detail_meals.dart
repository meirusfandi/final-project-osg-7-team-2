import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:final_project_osg7/core/network/service_details.dart';
import 'package:flutter/material.dart';

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

  ServiceDetails _serviceDetails;
  @override
  void initState() {
    _serviceDetails = ServiceDetails();
    super.initState();
  }
  
  // to swipe / pull refresh
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();

  Meals meals = Meals();

  String idMeals;
  String strMeals;

  Future<Null> _refresh() {
    return _serviceDetails.getDetails(widget.idMeals).then((_meals) {
      setState(() => meals = _meals as Meals);
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
    );
  }
}