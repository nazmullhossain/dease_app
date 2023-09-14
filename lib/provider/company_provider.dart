import 'dart:io';


import 'package:flutter/material.dart';

import '../helper/brand_database_helper.dart';
import '../helper/company_helper.dart';
import '../models/brands_models.dart';
import '../models/company_model.dart';



class CompanyProvider extends ChangeNotifier {
  CompanyProvider() {
    getRecipes();
  }



  File? image;


  List<CompanyData> allCompany = [];

  getRecipes() async {
    allCompany = await ItemDbHelper.dbHelper.getAllRecipes();
    notifyListeners();

  }



  deleteAll(){
    ItemDbHelper.dbHelper.deleteRecipes();

  }


}



