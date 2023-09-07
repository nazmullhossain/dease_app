import 'dart:convert';

import 'package:aiataf/const/global_const.dart';
import 'package:aiataf/helper/brand_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helper/company_helper.dart';
import '../models/company_model.dart';
import '../models/diseas_list_model.dart';
import '../models/diseases_model.dart';




class DiseasesListServices {
  Future<List<DListData>> getDiseasesServices(BuildContext context) async {
    List <DListData>dListData=[];

    try {
      final String url =
          "$uri/api/diseases/list?limit=20&page=1&date=2022-09-08";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("getDiseasesServices data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        DistModel comapanyModel = DistModel.fromJson(jsonRes);

        for (DListData data in comapanyModel.data!) {
          // await ItemDbHelper.dbHelper.insertNewRecipe(data);
          dListData.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return dListData;
  }
}
