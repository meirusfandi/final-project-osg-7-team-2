import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:final_project_osg7/core/model/model_favorite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> _database;
  static final Future<Directory> _directory = getExternalStorageDirectory();
  static final String _dbName = "final_project.db";
  static final String _tableName = "favorite_table";
  static final String _id = "id";
  static final String _idMeals = "mealsId";
  static final String _strMeals = "mealsName";
  static final String _strCategory = "mealsCategory";
  static final String _strArea = "mealsArea";
  static final String _strMealsInstructions = "mealsInstructions";
  static final String _strMealsThumb = "mealsThumb";
  static final String _strTags = "mealsTags";
  static final String _strIngredients = "mealsIngredients";

  // function to create and open database
  static void createDB() async {
    _database =  openDatabase(
      join((await _directory).path, _dbName),
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE $_tableName ("
          "$_id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$_idMeals TEXT,"
          "$_strMeals TEXT,"
          "$_strCategory TEXT,"
          "$_strArea TEXT,"
          "$_strMealsInstructions TEXT,"
          "$_strMealsThumb TEXT,"
          "$_strTags TEXT,"
          "$_strIngredients TEXT"
          ")"
        );
      },
      version: 1
    );
  }      

  // function to insert favorite to DB
  static Future<void> insert(Favorite favorite) async{
    Database db = await _database;
    await db.insert(
      _tableName,
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore
    );
  }

  // function to get all favorites
  static Future<List<Favorite>> getAll() async {
    Database db = await _database;
    List<Map<String, dynamic>> favorites = await db.query(
      _tableName
    );

    if (favorites.length > 0) {
      return List.generate(
        favorites.length,
        (int index) {
          return Favorite(
            id: favorites[index][_id],
            idMeals: favorites[index][_idMeals],
            strMeals: favorites[index][_strMeals],
            strCategory: favorites[index][_strCategory],
            strArea: favorites[index][_strArea],
            strMealsInstructions: favorites[index][_strMealsInstructions],
            strMealsThumb: favorites[index][_strMealsThumb],
            strTags: favorites[index][_strTags],
            strIngredients: favorites[index][_strIngredients],
          );
        },
      );
    } else {
      return null;
    }
  }

  // function to update favorite
  static Future<void> update(Favorite favorite) async {
    Database db = await _database;
    await db.update(
      _tableName,
      favorite.toMap(),
      where: "$_id = ?",
      whereArgs: [favorite.id]
    );
  }

  // function to delete favorite
  static Future<void> delete(int id) async {
    Database db = await _database;
    await db.delete(
      _tableName,
      where: "$_id = ?",
      whereArgs: [id]
    );
  }

}