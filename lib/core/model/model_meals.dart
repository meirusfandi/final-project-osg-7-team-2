import 'dart:convert';

ModelMeals mealsFromJSON(String str) => ModelMeals.fromJson(json.decode(str));

class ModelMeals {
  List<Meals> meals;

  ModelMeals({
      this.meals
  });

  factory ModelMeals.fromJson(Map<String, dynamic> json) => ModelMeals(
    meals: List<Meals>.from(json["meals"].map((x) => Meals.fromJSON((x))))
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
  String strYoutube;
  String strIngredients;

  Meals({
    this.idMeals,
    this.strMeals,
    this.strCategory,
    this.strArea,
    this.strMealsInstructions,
    this.strMealsThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredients
  });

  factory Meals.fromJSON(Map<String, dynamic> json) => Meals(
    idMeals: json["idMeal"],
    strMeals: json["strMeal"],
    strCategory: json["strCategory"],
    strArea: json["strArea"],
    strMealsInstructions: json["strInstructions"],
    strMealsThumb: json["strMealThumb"],
    strTags: json["strTags"],
    strYoutube: json["strYoutube"],
    strIngredients: json['strMeasure1'] + " \t" + json['strIngredient1'] + "\n"+
    json["strMeasure2"] + " \t" +json["strIngredient2"] + "\n"+
    json["strMeasure3"] + " \t" +json["strIngredient3"] + "\n"+
    json["strMeasure4"] + " \t" +json["strIngredient4"] + "\n"+
    json["strMeasure5"] + " \t" +json["strIngredient5"] + "\n"+
    json["strMeasure6"] + " \t" +json["strIngredient6"] + "\n"+
    json["strMeasure7"] + " \t" +json["strIngredient7"] + "\n"+
    json["strMeasure8"] + " \t" +json["strIngredient8"] + "\n"+ 
    json["strMeasure9"] + " \t" +json["strIngredient9"] + "\n"+
    json["strMeasure10"] + " \t" +json["strIngredient10"] + "\n"+
    json["strMeasure11"] + " \t" +json["strIngredient11"] + "\n"+
    json["strMeasure12"] + " \t" +json["strIngredient12"] + "\n"+
    json["strMeasure13"] + " \t" +json["strIngredient13"] + "\n"+
    json["strMeasure14"] + " \t" +json["strIngredient14"] + "\n"+
    json["strMeasure15"] + " \t" +json["strIngredient15"] + "\n"+
    json["strMeasure16"] + " \t" +json["strIngredient16"] + "\n"+
    json["strMeasure17"] + " \t" +json["strIngredient17"] + "\n"+ 
    json["strMeasure18"] + " \t" +json["strIngredient18"] + "\n"+
    json["strMeasure19"] + " \t" +json["strIngredient19"] + "\n"+ 
    json["strMeasure20"] + " \t" +json["strIngredient20"] + "\n"
  );

}