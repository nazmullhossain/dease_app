import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
   SearchWidget({super.key,required this.hintText});
  String hintText;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),


      child: TextField(

        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintStyle: TextStyle(
              color: Color(0xff516E95), fontSize: 12),


          hintText:hintText,
          fillColor: Color(0xffFCFCFC),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
