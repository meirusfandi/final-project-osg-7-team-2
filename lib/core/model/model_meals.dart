import 'dart:convert';

ModelMeals mealsFromJSON(String str) => ModelMeals.fromJson(json.decode(str));

class ModelMeals {
  Meals meals;

  ModelMeals({
      this.meals
  });

  factory ModelMeals.fromJson(Map<String, dynamic> json) => ModelMeals(
    meals: Meals.fromJSON(json['meals'])
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