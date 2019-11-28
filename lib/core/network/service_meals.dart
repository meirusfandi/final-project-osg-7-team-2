import 'dart:convert';
import 'package:final_project_osg7/core/model/model_list_meals.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class ServiceMeals {
  String mealsUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=';
  Future<ModelListMeals> getMeals(String categories) async {
    try {
      final response = await http.get(mealsUrl + categories);

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);

        print(json);

        ModelListMeals modelMeals = ModelListMeals.fromJSON(json);
        return modelMeals;
      } else {
        print("Failed to load by categories");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> isConnected() async {
    var connect = await (Connectivity().checkConnectivity());
    if (connect == ConnectivityResult.mobile) {
      return true;
    } else if (connect == ConnectivityResult.wifi){
      return true;
    }
    return false;
  }
}