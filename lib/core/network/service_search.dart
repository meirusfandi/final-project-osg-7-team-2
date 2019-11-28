import 'dart:convert';
import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class ServiceSearch {
  String searchUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';
  Future<ModelMeals> getSearchMeals(String searchName) async {
    try {
      final response = await http.get(searchUrl + searchName);

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);

        ModelMeals modelMeals = ModelMeals.fromJson(json);
        return modelMeals;
      } else {
        print("Failed to load meals "+searchName);
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