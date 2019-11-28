import 'dart:convert';

ModelListMeals mealsFromJSONList(String str) => ModelListMeals.fromJSON(json.decode(str));

class ModelListMeals {
  List<ListMeals> meals;

  ModelListMeals({
      this.meals
  });

  factory ModelListMeals.fromJSON(Map<String, dynamic> json) => ModelListMeals(
    meals: List<ListMeals>.from(json["meals"].map((x) => ListMeals.fromJSONList(x)))
  );
}

class ListMeals {
  String idMeals;
  String strMeals;
  String strMealsThumb;

  ListMeals({
    this.idMeals,
    this.strMeals,
    this.strMealsThumb
  });

  factory ListMeals.fromJSONList(Map<String, dynamic> json) => ListMeals (
    idMeals: json["idMeal"],
    strMeals: json["strMeal"],
    strMealsThumb: json["strMealThumb"]
  );
}