import 'dart:io';

import 'package:aiataf/models/brand_company_model.dart';
import 'package:aiataf/models/brands_models.dart';
import 'package:aiataf/models/company_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper2 {
  late Database database;
  static DbHelper2 dbHelper = DbHelper2();

  initDatabase() async {
    database = await connectToDatabase();
    return database;
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/skinvd.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        //brand table
        db.execute(
            'CREATE TABLE $tBrandTable ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $companyIdColumn INTEGER, $genericIdColumn INTEGER, $formColumn TEXT, $packsizeColumn TEXT, $strengthColumn TEXT,$priceColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');
        //generic table
        db.execute(
            'CREATE TABLE $tGenericTable ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $precautionIdColumn TEXT, $indicationIdColumn TEXT, $contraIndicationColumn TEXT, $sideEffectColumn TEXT, $modeOfActionColumn TEXT,$interactionColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$pregnancyColumn TEXT,$adultDoseColumn TEXT,$childDoseColumn TEXT,$renalDoseColumn TEXT,$administrationColumn TEXT,$therapeuticsColumn TEXT,$deletedAtColumn TEXT)');
        //company table
        db.execute(
            'CREATE TABLE $tCompanyTable ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        // db.execute(
        //     'CREATE TABLE $tBrandTable ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $companyIdColumn INTEGER, $genericIdColumn INTEGER, $formColumn TEXT, $packsizeColumn TEXT, $strengthColumn TEXT,$priceColumn TEXT,$createdAtColumn TEXT,$updatedAtColumn TEXT,$deleteAtColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        // db.delete(tBrandTable);
      },
    );
  }

  /**
   * table names
   */
  final String tBrandTable = 't_brand';
  final String tGenericTable = 't_generic';
  final String tCompanyTable = 't_company';

  /**
   * column names here
   */
  final String companyIdColumn = 'company_id';
  final String idColumn = 'id';
  final String genericIdColumn = 'generic_id';
  final String nameColumn = 'name';
  final String formColumn = 'form';
  final String packsizeColumn = 'packsize';
  final String strengthColumn = 'strength';
  final String priceColumn = 'price';
  final String createdAtColumn = 'created_at';
  final String updatedAtColumn = 'updated_at';
  final String deleteAtColumn = 'deleted_at';

  final String tableName = 'generic';
  final String precautionIdColumn = 'precaution';
  final String indicationIdColumn = 'indication';
  final String contraIndicationColumn = 'contraIndication';
  final String sideEffectColumn = 'sideEffect';
  final String modeOfActionColumn = 'modeOfAction';
  final String interactionColumn = 'interaction';
  final String pregnancyColumn = 'pregnancyCategoryNote';
  final String adultDoseColumn = 'adult_dose';
  final String childDoseColumn = 'child_dose';
  final String renalDoseColumn = 'renal_dose';
  final String administrationColumn = 'administration';
  final String deletedAtColumn = 'deleted_at';
  final String therapeuticsColumn = 'therapeutics';



  Future<List<Product>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tBrandTable);

    print("merge data---------------------.${tasks}");

    print("merge length-------------------->${tasks.length}");
    return tasks.map((e) => Product.fromMap(e)).toList();
  }

  insertBrand(Data recipeModel) {
    database.insert(tBrandTable, recipeModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  insertCompany(CompanyData recipeModel) {
    database.insert(tCompanyTable, recipeModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // insertNewRecipe2(CompanyData recipeModel) {
  //   database.insert("company", recipeModel.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // deleteRecipe(Data recipeModel) {
  //   database.delete(tableName, where: '$idColumn=?', whereArgs: [recipeModel]);
  // }

  deleteRecipes() {
    database.delete(tBrandTable);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await database;
    return await db.rawQuery('''
    select 
    branddata.*, company.id as company_id,company.name as company_name 
    from branddata 
    left join company on branddata.company_id = company.id 
    ''');
  }

// Future<List<Map<String, dynamic>>> leftJoinTables() async {
//   final  db =  await database;
//
//   final query = '''
//   SELECT branddata.*, company.*
//   FROM branddata
//   LEFT JOIN company ON branddata.company_id = company.id
// ''';
//
//   return await db.rawQuery(query);
// }
}
