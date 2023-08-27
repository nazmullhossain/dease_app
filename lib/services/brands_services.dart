import 'dart:convert';

import 'package:aiataf/const/error_handling.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/brands_models.dart';

class BrandServices {





Future <List<Data>> geBrand(BuildContext context)async{
  List<Data> insertData = [];


  try{
    final String url = "http://skinvd.itmapi.com/api/drugs/brands?limit=22&page=1&date=2022-01-01";

     Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

    http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("get data${res.body}");


      if(res.statusCode==200){
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        BrandModel brandModel=BrandModel.fromJson(jsonRes);

        for(Data data in brandModel.data!){
            insertData.add(data);
        }

      }else{

      }



  }catch(e){
print(e.toString());
  }
  return insertData;

}



}



