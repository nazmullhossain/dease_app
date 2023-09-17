import 'package:aiataf/helper/db_helper.dart';

class GetQuery {

  Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await DbHelper2().initDatabase();
    return await db.rawQuery('''
    select 
    ${DbHelper2().tBrandTable}.*, 
    ${DbHelper2().tCompanyTable}.id as company_id,
    ${DbHelper2().tCompanyTable}.name as company_name 
    from ${DbHelper2().tBrandTable} 
    left join ${DbHelper2().tCompanyTable} on ${DbHelper2().tBrandTable}.id = ${DbHelper2().tCompanyTable}.id 
    ''');
  }

}