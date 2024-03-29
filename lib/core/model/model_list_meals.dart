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

List<ListMeals> getMealsSuggestions(String query, List<ListMeals> meals) {
  List<ListMeals> matches = List();

  matches.addAll(meals);
  matches.retainWhere((meal) => meal.strMeals.toLowerCase().contains(query.toLowerCase()));

  if (query == '') {
    return meals;
  } else {
    return matches;
  }
}