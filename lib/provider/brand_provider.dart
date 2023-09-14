import 'dart:io';

import 'package:flutter/material.dart';

import '../helper/brand_database_helper.dart';
import '../models/brands_models.dart';

class RecipeClass extends ChangeNotifier {
  RecipeClass() {
    getRecipes();

  }
  String tableColumn = "branddata";
  File? image;
  List<Map<String, dynamic>> data = [];

  List<Data> allRecipes = [];
  List<Data> alljoinData = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController subtitleColumnController = TextEditingController();

  getRecipes() async {
    allRecipes= await DbHelper.dbHelper.getAllRecipes();
    notifyListeners();
  }

  joinData() async {
    await DbHelper.dbHelper.getAllData();
  }

  joinGetData() async {
    data = await DbHelper.dbHelper.getAllData();
  }

  deleteAll() {
    DbHelper.dbHelper.deleteRecipes();
  }
}
