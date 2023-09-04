import 'dart:io';

import 'package:flutter/material.dart';

import '../helper/brand_database_helper.dart';
import '../helper/company_helper.dart';
import '../helper/generic_database.dart';
import '../models/brands_models.dart';
import '../models/company_model.dart';
import '../models/generic_model.dart';

class GenericProvider extends ChangeNotifier {
  GenericProvider() {
    getGenric();
  }

  File? image;

  List<GenericData> allGeneric = [];

  getGenric() async {
    allGeneric = await GenericDbHelper.dbHelper.getAllGeneric();
    notifyListeners();
  }

  deleteAll() {
    ItemDbHelper.dbHelper.deleteRecipes();
  }
}
