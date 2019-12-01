import 'dart:convert';

ModelMeals mealsFromJSON(String str) => ModelMeals.fromJSON(json.decode(str));

class ModelMeals {
  List<Meals> meals;

  ModelMeals({
      this.meals
  });

  factory ModelMeals.fromJSON(Map<String, dynamic> json) => ModelMeals(
    meals: List<Meals>.from(json["meals"].map((x) => Meals.fromJSON(x)))
  );
}

class Meals {
  String idMeals;
  String strMeals;
  String strCategory;
  String strArea;
  String strMealsInstructions;
  String strMealsThumb;
  String strTags;

  Meals({
    this.idMeals,
    this.strMeals,
    this.strCategory,
    this.strArea,
    this.strMealsInstructions,
    this.strMealsThumb,
    this.strTags,
  });

  factory Meals.fromJSON(Map<String, dynamic> json) => Meals(
      idMeals: json["idMeal"],
      strMeals: json["strMeal"],
      strCategory: json["strCategory"],
      strArea: json["strArea"],
      strMealsInstructions: json["strInstructions"],
      strMealsThumb: json["strMealThumb"],
      strTags: json["strTags"]
    );
}