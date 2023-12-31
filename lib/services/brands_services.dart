import 'dart:convert';
import 'dart:io';

import 'package:aiataf/const/error_handling.dart';
import 'package:aiataf/helper/brand_database_helper.dart';
import 'package:aiataf/helper/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../models/brands_models.dart';

class BrandServices {
  Future<List<Data>> geBrand(BuildContext context) async {
    List<Data> insertData = [];

    try {
      final String url = "http://skinvd.itmapi.com/api/drugs/brands";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("get data-----------.${res.body}");
      print("get brandddddddddddddddddddd       ${res.body.length}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print("totla----------->${jsonRes["meta"]["total"]}");

        // BrandModel brandModel=BrandModel.fromJson(jsonRes);
        Data brandModel = Data();


        print("helwo---------------->${insertData}");



        // for(Data data in brandModel.data!){
        //   await  DbHelper2.dbHelper.insertBrand(data);
        //     insertData.add(data);
        //
        // }
      }
    } on SocketException {
      Fluttertoast.showToast(
          msg: "No internet connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      print(e.toString());
    }
    return insertData;
  }
}
