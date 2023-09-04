// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// import '../models/brands_models.dart';
//
// class DatabaseHelper {
//   static const _databaseName = 'brand.db';
//   // ignore: constant_identifier_names
//   static const int DB_VERSION = 1;
//
//   //singleton class
//   DatabaseHelper._();
//
//   static final DatabaseHelper instance = DatabaseHelper._();
//
//   Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//   //init database
//   _initDatabase() async {
//     Directory dataDirectory = await getApplicationDocumentsDirectory();
//     String dbPath = join(dataDirectory.path, _databaseName);
//     return await openDatabase(dbPath,
//         version: DB_VERSION, onCreate: _onCreateDB);
//   }
//
//   Future _onCreateDB(Database db, int version) async {
//     //create tables
//     await db.execute('''
// 		  CREATE TABLE ${BrandModel.tblBlog}(
// 			${BrandModel.colIdBg} INTEGER PRIMARY KEY AUTOINCREMENT,
// 			${BrandModel.companyId} INTEGER,
// 			${BrandModel.colgenericId} INTEGER,
// 			${BrandModel.colname} TEXT,
// 			${BrandModel.colform} TEXT,
// 			${BrandModel.colstrength} TEXT,
// 			${BrandModel.colprice} TEXT,
// 			${BrandModel.colpacksize} TEXT
//
// 			)
// 		  ''');
//   }
//   //Data - insert
//   Future<int> insertData(BrandModel brandModel) async {
//     Database db = await database;
//     return await db.insert(BrandModel.tblBlog, brandModel.toJson());
//   }
//   Future<int> updateDatag(Data blog) async {
//     final db = await database;
//   //Data - update
//     var result = await db.update(BrandModel.tblBlog, blog.toJson(),
//         where: "${BrandModel.colIdBg} = ?", whereArgs: [blog.id]);
//     return result;
//   }
//   //Data - delete
//   Future<int> deleteData(int id) async {
//     Database db = await database;
//     return await db.delete(BrandModel.tblBlog,
//         where: '${BrandModel.colIdBg}=?', whereArgs: [id]);
//   }
//   // get one Data
//
//   Future<BrandModel> getOneData(int id) async {
//     Database db = await database;
//     var sql =
//         "SELECT * FROM ${BrandModel.tblBlog} WHERE ${BrandModel.colIdBg} = $id";
//     var result = await db.rawQuery(sql);
//     if (result.length == 0) return BrandModel();
//     return  BrandModel.fromJson(result.first);
//   }
//
//   //Data - retrieve all
//   Future<List<BrandModel>> fetchDatas() async {
//     Database db = await database;
//     List blogs = await db.query(BrandModel.tblBlog);
//     return blogs.isEmpty
//         ? []
//         : blogs.map((x) => BrandModel.fromJson(x)).toList();
//   }
//
//   // ignore: body_might_complete_normally_nullable
//   // Future<int?> closeDb() async {
//   //   var dbClient = await database;
//   //   await dbClient.close();
//   // }
//   //
//   // deleteAll() async {
//   //   final dbClient = await database;
//   //   dbClient.rawDelete("Delete from ${DataModel.tblBlog}");
//   // }
//
// }

import 'dart:io';

import 'package:aiataf/models/brands_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/company_model.dart';
import '../models/generic_model.dart';

class GenericDbHelper {
  late Database database;
  static GenericDbHelper dbHelper = GenericDbHelper();
  final String tableName = 'generic';
  final String precautionIdColumn = 'precaution';
  final String idColumn = 'id';
  final String indicationIdColumn = 'indication';
  final String nameColumn = 'name';
  final String contraIndicationColumn = 'contraIndication';
  final String sideEffectColumn = 'sideEffect';
  final String modeOfActionColumn = 'modeOfAction';
  final String interactionColumn = 'interaction';
  final String pregnancyColumn = 'pregnancyCategoryNote';
  final String adultDoseColumn = 'adult_dose';
  final String childDoseColumn = 'child_dose';
  final String renalDoseColumn = 'renal_dose';
  final String administrationColumn = 'administration';
  final String createdAtColumn = 'created_at';
  final String updatedAtColumn = 'updated_at';
  final String deletedAtColumn = 'deleted_at';
  final String therapeuticsColumn = 'therapeutics';

  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/generictable.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            // 'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $productNameColumn TEXT, $priceColumn INTEGER,$vatPercentColumn INTEGER,  $categoryNameColumn TEXT, $companyNameColumn TEXT, $unitNameColumn TEXT,$genericNameColumn TEXT,$strengthColumn TEXT,)');

            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $precautionIdColumn TEXT, $indicationIdColumn TEXT, $contraIndicationColumn TEXT, $sideEffectColumn TEXT, $modeOfActionColumn TEXT,$interactionColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$pregnancyColumn TEXT,$adultDoseColumn TEXT,$childDoseColumn TEXT,$renalDoseColumn TEXT,$administrationColumn TEXT,$therapeuticsColumn TEXT,$deletedAtColumn TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $precautionIdColumn TEXT, $indicationIdColumn INTEGER, $contraIndicationColumn TEXT, $sideEffectColumn TEXT, $modeOfActionColumn TEXT,$interactionColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$pregnancyColumn TEXT,$adultDoseColumn TEXT,$childDoseColumn TEXT,$renalDoseColumn TEXT,$administrationColumn TEXT,$therapeuticsColumn TEXT,$deletedAtColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<GenericData>> getAllGeneric() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);

    print("data---------------------.${tasks}");

    print("lentht-------------------->${tasks.length}");
    return tasks.map((e) => GenericData.fromJson(e)).toList();
  }

  insertNewRecipe(GenericData genericData) {
    database.insert(tableName, genericData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // insertNewRecipe2(CompanyData recipeModel) {
  //   database.insert("company", recipeModel.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  deleteRecipe(Data recipeModel) {
    database.delete(tableName, where: '$idColumn=?', whereArgs: [recipeModel]);
  }

  deleteRecipes() {
    database.delete(tableName);
  }

  // Future<List<Map<String, dynamic>>> getAllData() async {
  //   final db = await database;
  //   return await db.rawQuery('''
  //   select
  //   company.company_name, branddata.*
  //   from branddata
  //   left join company on branddata.company_id = company.id
  //   ''');
  //
  //
  //
  // }
}
