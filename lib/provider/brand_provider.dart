import 'dart:io';


import 'package:flutter/material.dart';

import '../helper/brand_database_helper.dart';
import '../models/brands_models.dart';



class RecipeClass extends ChangeNotifier {
  RecipeClass() {
    getRecipes();
  }



  File? image;
  List<Map<String,dynamic>>data=[];


  List<Data> allRecipes = [];

  getRecipes() async {
    allRecipes = await DbHelper.dbHelper.getAllRecipes();
    notifyListeners();

  }


  // joinGetData()async{
  //   data=await DbHelper.dbHelper.getAllData();
  //
  // }


  deleteAll(){
    DbHelper.dbHelper.deleteRecipes();

  }


}



