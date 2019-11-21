import 'dart:convert';

ModelCategories categoriesFromJSON(String str) => ModelCategories.fromJson(json.decode(str));
String modelCategoriesToJSON(ModelCategories data) => json.encode(data.toJSON());

class ModelCategories {
  List<Categories> categories;

  ModelCategories({
      this.categories
  });

  factory ModelCategories.fromJson(Map<String, dynamic> json) => ModelCategories(
    categories: List<Categories>.from(json["categories"].map((x) => Categories.fromJson((x))))
  );

  Map<String, dynamic> toJSON() => {
    "categories": List<Categories>.from(categories.map((x) => x.toJSON())),
  };
}

class Categories {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Categories({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    idCategory: json["idCategory"],
    strCategory: json["strCategory"],
    strCategoryThumb: json["strCategoryThumb"],
    strCategoryDescription: json["strCategoryDescription"],
  );

  Map<String, dynamic> toJSON() => {
    "idCategory": idCategory,
    "strCategory": strCategory,
    "strCategoryThumb": strCategoryThumb,
    "strCategoryDescription": strCategoryDescription,
  };
}