import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/error_handling.dart';
import '../const/global_const.dart';
import '../models/login_model.dart';
import '../utils/utilss.dart';
import '../widget/bottom_bar_widget.dart';

class LoginService {
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
      };

      http.Response res = await http.post(Uri.parse("$uri/api/auth/login"),
          body: {'email': email, 'password': password}, headers: headers);
      print("login data${res.body}");

      if (res.statusCode == 200) {
        var jsonResponse = jsonDecode(res.body);
        print("Response print: $jsonResponse");
        LoginModel login = LoginModel.fromJson(jsonResponse);
        if (login.success == true) {
       await   saveTokenToSharedPreferences(res.body);
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBarWidget.routeName, (route) => false);
          Fluttertoast.showToast(
              msg: "Login Sucess",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (login.success == false) {
          Fluttertoast.showToast(
              msg: "Login unsucess",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }

      // } else {
      //   print("Login faild ${res.statusCode}");
      //   Fluttertoast.showToast(
      //       msg: "Login UnSucess",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0
      //   );
      //
      // }

      // httpErrorHandle(response: res, context: context, onSuccess: ()async{
      //   // final prefs = await SharedPreferences.getInstance();
      //   // await   prefs.setString("access_token", jsonDecode(res.body)['access_token']);
      //   Navigator.pushNamedAndRemoveUntil(context, BottomBarWidget.routeName, (route) => false);
      //
      // });
    } catch (error) {
      showSnackBar(context, error.toString());
      Fluttertoast.showToast(
          msg: "Login UnSucess",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> saveTokenToSharedPreferences(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
