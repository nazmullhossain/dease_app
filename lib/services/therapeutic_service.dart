import 'dart:convert';

import 'package:aiataf/const/global_const.dart';
import 'package:aiataf/helper/brand_database_helper.dart';
import 'package:aiataf/models/therapeutic_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/diseas_list_model.dart';






class TherapeuticServices {
  Future<List<TherapeuticData>> gettherapeuticServices(BuildContext context) async {
    List <TherapeuticData>therapeuticData=[];

    try {
      final String url =
          "$uri/api/drugs/therapeutics?limit=15&page=1&date=2022-09-02";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("getDiseasesServices data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        TherapeuticModel therapeuticModel = TherapeuticModel.fromJson(jsonRes);

        for (TherapeuticData data in therapeuticModel.data!) {
          // await ItemDbHelper.dbHelper.insertNewRecipe(data);
          therapeuticData.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return therapeuticData;
  }
}
