import 'dart:io';


import 'package:flutter/material.dart';

import '../helper/brand_database_helper.dart';
import '../helper/company_helper.dart';
import '../models/brands_models.dart';
import '../models/company_model.dart';



class RecipeClass extends ChangeNotifier {
  RecipeClass() {
    getRecipes();
  }



  File? image;


  List<CompanyData> allRecipes = [];

  getRecipes() async {
    allRecipes = await CompanyDbHelper.dbHelper.getAllRecipes();
    notifyListeners();

  }


  deleteAll(){
    DbHelper.dbHelper.deleteRecipes();

  }


}



