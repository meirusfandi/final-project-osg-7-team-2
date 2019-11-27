import 'package:final_project_osg7/core/local/helper/database_helper.dart';
import 'package:final_project_osg7/core/model/model_favorite.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteScreen> {

  List<Favorite> _listData = List();

  void getFavorite() async {
    List<Favorite> favorites = await DatabaseHelper.getAll();
    setState(() {
      if (favorites != null) {
        _listData = favorites;
      } else {
        _listData = List();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getFavorite();
    super.initState();
  }

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
        title: Text('Favorite Meals'),
      ),
      body: ListView.separated(
        itemCount: _listData.length,
        itemBuilder: (BuildContext context, int index) {
          if (_listData != null) {
            return noDataView("Favorite value is null");
          } else if (_listData.length > 0) {
            return ListTile(
              leading: Image.network(
                _listData[index].strMealsThumb
              ),
              title: Text(
                _listData[index].strMeals,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 1,
              ),
              subtitle: Text(
                _listData[index].strMealsInstructions,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 3,
              ),
              onTap: (){
                showToast(_listData[index].strMeals+" clicked");
              },
            );
          } else {
            return noDataView("Favorite data not found.");
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      )
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}