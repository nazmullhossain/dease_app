import 'dart:convert';

import 'package:aiataf/const/global_const.dart';
import 'package:aiataf/models/Investigation_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/diseases_model.dart';




class InvestigationServices {
  Future<List<InvestigationData>> getInvestigationServices(BuildContext context) async {
    List <InvestigationData>investigationData=[];

    try {
      final String url =
          "$uri/api/investigation/categories?limit=15&page=1&date=2022-09-08";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("getDiseasesServices data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        InvestigationModel comapanyModel = InvestigationModel.fromJson(jsonRes);

        for (InvestigationData data in comapanyModel.data!) {
          // await ItemDbHelper.dbHelper.insertNewRecipe(data);
          investigationData.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return investigationData;
  }
}
