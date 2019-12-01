import 'dart:convert';

class Favorite {
  int id;
  String idMeals;
  String strMeals;
  String strCategory;
  String strArea;
  String strMealsInstructions;
  String strMealsThumb;
  String strTags;

  Favorite({
    this.id,
    this.idMeals,
    this.strMeals,
    this.strCategory,
    this.strArea,
    this.strMealsInstructions,
    this.strMealsThumb,
    this.strTags,
  });

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "mealsId" : idMeals,
      "mealsName" : strMeals,
      "mealsCatefory" : strCategory,
      "mealsArea" : strArea,
      "mealsInstructions" : strMealsInstructions,
      "mealsThumb" : strMealsThumb,
      "mealsTags" : strTags
    };
  }
}