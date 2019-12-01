import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_project_osg7/core/model/model_categories.dart';
import 'package:connectivity/connectivity.dart';

class ServiceCategories {
  String categoriesUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  Future<ModelCategories> getCategories() async {
    try {
      final response = await http.get(categoriesUrl);

      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);

        ModelCategories modelCategories = ModelCategories.fromJson(json);
        return modelCategories;
      } else {
        print("Failed to load categories");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}