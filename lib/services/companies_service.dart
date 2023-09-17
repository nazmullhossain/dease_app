import 'dart:convert';

import 'package:aiataf/helper/brand_database_helper.dart';
import 'package:aiataf/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helper/company_helper.dart';
import '../models/company_model.dart';




class ComapanyServices {
  Future<List<CompanyData>> getCompany(BuildContext context) async {
List <CompanyData>insertCompany=[];

    try {
      final String url =
          "http://skinvd.itmapi.com/api/drugs/companies";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("company data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        ComapanyModel comapanyModel = ComapanyModel.fromJson(jsonRes);

        for (CompanyData data in comapanyModel.data!) {
          await DbHelper2.dbHelper.insertCompany(data);
          insertCompany.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return insertCompany;
  }
}
