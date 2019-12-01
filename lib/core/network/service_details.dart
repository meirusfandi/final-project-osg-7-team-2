import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:final_project_osg7/core/model/model_meals.dart';

class ServiceDetails {
  String detailsUrl = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=';
  Future<ModelMeals> getDetails(String idMeals) async {
    try {
      
      final response = await http.get(detailsUrl + idMeals);

      if (response.statusCode == 200) {

        ModelMeals result = ModelMeals.fromJSON(jsonDecode(response.body));
        
        return result;
      } else {
        print("Failed to load details meals with id "+idMeals);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}