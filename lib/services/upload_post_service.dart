import 'dart:convert';
import 'dart:io';

import 'package:aiataf/const/global_const.dart';
import 'package:aiataf/utils/utilss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UploadPostService {
  void uplodPost({
    required BuildContext context,
    required String catagory,
    required String title,
    required String subTitle,
    required String img,
  }) async {
    try{
      final String url = "$uri/api/cases";
      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };


      http.Response res=await http.post(Uri.parse(url),

      headers: headers,
        body: {
        'case_category_id':"1",
          'title':title,
          'short_desc':subTitle,
          'thumbnail':img
        }

      );
      print("uplaod image ${res.body}");

      if(res.statusCode==200){
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);
        print("sucessfully upload to your post");
      }
      else{
        print("your post not send");
      }


    }catch(e){
      showSnackBar(context, e.toString());
      print("no send ${e.toString()}");
    }


  }



  // void uploadImage(File filename,BuildContext context) async {
  //   LoginData loginData=LoginData();
  //   // LoginData login = LoginData.fromJson(jsonResponse);
  //   // Replace with the URL of your API
  //   var apiUrl = Uri.parse('http://139.59.119.57/api/prescription_upload');
  //
  //   // Replace with your X-Auth-Token
  //   var authToken = "${getIt<MainBloc>().key}";
  //
  //   // Replace with the file path to your image
  //   var filePath = filename.path;
  //
  //   // Create a File object from the image file path
  //   var file = File(filePath);
  //
  //   // Create a multipart request
  //   var request = http.MultipartRequest('POST', apiUrl);
  //
  //   // Add the X-Auth-Token header
  //   request.headers['X-Auth-Token'] = authToken;
  //
  //   // Add the image file to the request
  //   request.files.add(http.MultipartFile(
  //     'file_name',
  //     file.readAsBytes().asStream(),
  //     file.lengthSync(),
  //     filename: filename.toString(),
  //   ));
  //
  //   // Add other form fields if needed
  //   // request.fields['phone'] = '+8801604371820';
  //   // request.fields['password'] = '123456';
  //
  //   // Send the request
  //   var response = await request.send();
  //
  //   // Check the response
  //   if (response.statusCode == 200) {
  //
  //     Fluttertoast.showToast(
  //         msg: "Prescription Image uploaded successfully",
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //
  //     print('Image uploaded successfully');
  //
  //   } else {
  //
  //     Fluttertoast.showToast(
  //         msg: "Prescription Image uploaded unsuccessful ${response.statusCode}",
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //
  //     print('Image upload failed with status code: ${response.statusCode}');
  //   }
  // }

}
