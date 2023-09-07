import 'dart:convert';

import 'package:aiataf/const/global_const.dart';
import 'package:aiataf/models/Investigation_model.dart';
import 'package:aiataf/models/atlas_catagory_model.dart';
import 'package:aiataf/models/video_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/diseases_model.dart';
import '../models/quiz_model.dart';




class QuizServices {
  Future<List<QuizData>> getQuizServices(BuildContext context) async {
    List <QuizData>quizData=[];

    try {
      final String url =
          "$uri/api/quiz/categories?limit=12&page=1&date=2022-09-08";

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("getDiseasesServices data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        QuizModel quizModel = QuizModel.fromJson(jsonRes);

        for (QuizData data in quizModel.data!) {
          // await ItemDbHelper.dbHelper.insertNewRecipe(data);
          quizData.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return quizData;
  }
}
