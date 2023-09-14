


import 'dart:io';


import 'package:aiataf/models/brands_models.dart';
import 'package:aiataf/models/diseas_list_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/company_model.dart';



class DiseasesHelper {
  late Database database;
  static DiseasesHelper dbHelper = DiseasesHelper();
  final String tableName = 'diseasecontent';
  final String idColumn = 'id';
  final String detailsIdColumn = 'details';
  final String nameColumn = 'name';
  final String searchKeyColumn = 'search_key';
  final String diseaseCategoryIdColumn = 'disease_category_id';
  final String  advertisementsColumn = 'advertisements';
  final String myRatingColumn = 'my_rating';
  final String createdAtColumn = 'created_at';
  final String updatedAtColumn = 'updated_at';
  final String deleteAtColumn = 'deleted_at';



  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/diseasecontent.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          // 'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $productNameColumn TEXT, $priceColumn INTEGER,$vatPercentColumn INTEGER,  $categoryNameColumn TEXT, $companyNameColumn TEXT, $unitNameColumn TEXT,$genericNameColumn TEXT,$strengthColumn TEXT,)');


            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $detailsIdColumn TEXT, $searchKeyColumn TEXT, $nameColumn TEXT, $diseaseCategoryIdColumn INTEGER, $advertisementsColumn INTEGER, $myRatingColumn TEXT, $createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');



      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $detailsIdColumn TEXT, $searchKeyColumn TEXT, $nameColumn TEXT,  $diseaseCategoryIdColumn INTEGER, $advertisementsColumn INTEGER, $myRatingColumn TEXT, $createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<DListData>> getAllDiseaseContent() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);

    print("dreasese content---------------------.${tasks}");


    print("dreasese content length-------------------->${tasks.length}");
    return tasks.map((e) => DListData.fromJson(e)).toList();
  }

  insertNewRecipe(DListData recipeModel) {
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





