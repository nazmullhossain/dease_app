import 'dart:convert';

import 'package:aiataf/const/global_const.dart';
import 'package:aiataf/models/Investigation_model.dart';
import 'package:aiataf/models/atlas_catagory_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/diseases_model.dart';




class AtlasCatagoryServices {
  Future<List<AtlasCatagoryData>> getAtlasCatagoryServices(BuildContext context) async {
    List <AtlasCatagoryData>atlasCatagoryData=[];

    try {
      final String url =
          "$uri/api/atlas/categories?limit=12&page=1&date=2022-09-08";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("getDiseasesServices data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        AtlasCategoriesModel comapanyModel = AtlasCategoriesModel.fromJson(jsonRes);

        for (AtlasCatagoryData data in comapanyModel.data!) {
          // await ItemDbHelper.dbHelper.insertNewRecipe(data);
          atlasCatagoryData.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return atlasCatagoryData;
  }
}
