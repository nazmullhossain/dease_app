import 'dart:convert';

import 'package:aiataf/const/global_const.dart';
import 'package:aiataf/models/Investigation_model.dart';
import 'package:aiataf/models/atlas_catagory_model.dart';
import 'package:aiataf/models/case_model.dart';
import 'package:aiataf/models/video_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/diseases_model.dart';




class CaseServices {
  Future<List<CaseData>> getCaseServices(BuildContext context) async {
    List <CaseData>caseData=[];

    try {
      final String url =
          "$uri/api/cases?limit=13&page=1&date=2022-09-08";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("getDiseasesServices data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        CaseModel caseModel = CaseModel.fromJson(jsonRes);

        for (CaseData data in caseModel.data!) {
          // await ItemDbHelper.dbHelper.insertNewRecipe(data);
          caseData.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return caseData;
  }
}
