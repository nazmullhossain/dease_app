import 'dart:io';


import 'package:aiataf/helper/doctor_helper.dart';
import 'package:flutter/material.dart';

import '../helper/brand_database_helper.dart';
import '../models/brands_models.dart';

class DoctorProvider extends ChangeNotifier {
  DoctorProvider() {
    // getRecipes();
  }
  String tableColumn="branddata";
  File? image;
  List<Map<String, dynamic>> data = [];

  List<Data> allRecipes = [];
  List<Data> alljoinData = [];

  // getRecipes() async {
  //   allRecipes = await DoctorHelper.dbHelper.getAllRecipes();
  //   notifyListeners();
  // }
  joinData()async{
    await DbHelper.dbHelper.getAllData();
  }



  // joinGetData()async{
  //   data=await DbHelper.dbHelper.getAllData();
  //
  // }

  deleteAll() {
    DbHelper.dbHelper.deleteRecipes();
  }
}
