import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/generic_model.dart';
import 'package:http/http.dart' as http;
class GenericService{
  Future<List<GenericData>> getGeneric(BuildContext context) async {
    List <GenericData>insertGeneric=[];

    try {
      final String url =
          "http://skinvd.itmapi.com/api/drugs/generics?limit=20&page=34&date=2022-05-12";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("generic data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        GenericModel genericModelModel = GenericModel.fromJson(jsonRes);

        for (GenericData data in genericModelModel.data!) {
          insertGeneric.add(data);
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return insertGeneric;
  }
}