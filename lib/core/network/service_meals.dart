import 'dart:convert';
import 'package:final_project_osg7/core/model/model_meals.dart';
import 'package:http/http.dart' as http;

class ServiceMeals {
  String mealsUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=';
  Future<ModelMeals> getMeals(String categories) async {
    try {
      final response = await http.get(mealsUrl + categories);

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);

        ModelMeals modelMeals = ModelMeals.fromJson(json);
        return modelMeals;
      } else {
        print("Failed to load by categories");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}