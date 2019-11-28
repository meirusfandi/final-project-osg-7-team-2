import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:connectivity/connectivity.dart';

class ServiceDetails {
  String detailsUrl = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=';
  Future<ModelMeals> getDetails(String idMeals) async {
    try {
      final response = await http.get(detailsUrl+ idMeals);

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);

        ModelMeals details = ModelMeals.fromJson(json);
        return details;
      } else {
        print("Failed to load details meals with id "+idMeals);
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