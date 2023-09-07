


import 'dart:io';


import 'package:aiataf/models/brands_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/company_model.dart';



class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName = 'branddata';
  final String companyIdColumn = 'company_id';
  final String idColumn = 'id';
  final String genericIdColumn = 'generic_id';
  final String  nameColumn = 'name';
  final String formColumn = 'form';
  final String packsizeColumn = 'packsize';
  final String strengthColumn = 'strength';
  final String priceColumn = 'price';
  final String createdAtColumn = 'created_at';
  final String updatedAtColumn = 'updated_at';
  final String deleteAtColumn = 'deleted_at';



  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/mybrandd.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          // 'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $productNameColumn TEXT, $priceColumn INTEGER,$vatPercentColumn INTEGER,  $categoryNameColumn TEXT, $companyNameColumn TEXT, $unitNameColumn TEXT,$genericNameColumn TEXT,$strengthColumn TEXT,)');


            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $companyIdColumn INTEGER, $genericIdColumn INTEGER, $formColumn TEXT, $packsizeColumn TEXT, $strengthColumn TEXT,$priceColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');



      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $companyIdColumn INTEGER, $genericIdColumn INTEGER, $formColumn TEXT, $packsizeColumn TEXT, $strengthColumn TEXT,$priceColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<Data>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);

    print("brand data---------------------.${tasks}");


    print("grand length-------------------->${tasks.length}");
    return tasks.map((e) => Data.fromJson(e)).toList();
  }

  insertNewRecipe(Data recipeModel) {
    database.insert(tableName, recipeModel.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // insertNewRecipe2(CompanyData recipeModel) {
  //   database.insert("company", recipeModel.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  deleteRecipe(Data recipeModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [recipeModel]);
  }

  deleteRecipes() {
    database.delete(tableName);

  }



  Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await database;
    return await db.rawQuery('''
    select 
    company.company_name, branddata.* 
    from branddata 
    left join company on branddata.company_id = company.id 
    ''');
  }
}





