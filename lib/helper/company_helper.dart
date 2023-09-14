
import 'dart:io';




import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/company_model.dart';

class ItemDbHelper  {
  // final brandProvider=Provider.of<RecipeClass>(context,listen: false);

  late Database database;
  static ItemDbHelper  dbHelper = ItemDbHelper ();
  final String tableName = 'company';
  final String idColumn = 'id';
  final String nameColumn = 'name';
  final String createdAtColumn = 'created_at';
  final String updatedAtColumn = 'updated_at';
  final String deleteAtColumn = 'deleted_at';

  initDatabase() async {
    database = await connectToDatabase();
  }


  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/mycompanyy.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<CompanyData>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);

    print("CompanyData---------------------.${tasks}");

    print("CompanyData-------------------->${tasks.length}");
    return tasks.map((e) => CompanyData.fromJson(e)).toList();
  }

  insertNewRecipe(CompanyData companyData) {
    database.insert(tableName, companyData.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteRecipe(CompanyData recipeModel) {
    database.delete(tableName, where: '$idColumn=?', whereArgs: [recipeModel]);
  }

  deleteRecipes() {
    database.delete(tableName);
  }





}
