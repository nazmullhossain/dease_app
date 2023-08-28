import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/generic_model.dart';
import 'package:http/http.dart' as http;
class GenericService{
  Future<List<GenericData>> getCompany(BuildContext context) async {
    List <GenericData>insertGeneric=[];

    try {
      final String url =
          "3eb46242aad791aefa762d89a01f631aa5c09f1c73c3bae55df33bcaaa769c";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("company data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        GenericModel genericModelModel = GenericModel.fromJson(jsonRes);

        for (GenericData data in genericModelModel.data!) {
          insertGeneric.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return insertGeneric;
  }
}