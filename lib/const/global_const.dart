import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


 String uri="http://skinvd.itmapi.com";
final kBarlow = GoogleFonts.barlow(

);
class GlobalVarriable {


  static const appBarGradiant=LinearGradient(
      colors:[
        Color.fromARGB(255, 29, 201, 192),
        Color.fromARGB(255, 125, 221, 216),


      ],
      stops: [0.5,1.0]
  );
  static const secondaryColor=Color.fromRGBO(255, 153, 0, 1);
  static const backGroundColor=Colors.white;
  static const Color greyBackgroundColor=Color(0xffebecee);
  static var selectedNavBarColor=Colors.cyan[800]!;
  static const unSelectedNavBarColor=Color(0xfff2efe8);



  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Diseases',
      'image': 'images/skin.png',
    },
    {
      'title': 'Drugs',
      'image': 'images/drugs.png',
    },
    {
      'title': 'Tests',
      'image': 'images/atlas.png',
    },
    {
      'title': 'Atlas',
      'image': 'images/atlas.png',
    },
    {
      'title':  'Videos',
      'image': 'images/atlas.png',
    },
    {
      'title':  'Quizzes',
      'image':'images/mcq.png',
    },
    {
      'title': 'Case Studis',
      'image':'images/case-study.png',
    },
    {
      'title': 'Consultants',
      'image':'images/atlas.png',
    },
  ];





  static List<MyListItem> items = [
    MyListItem(
      title: 'Diseases',

      image: 'images/skin.png',
    ),
    MyListItem(
      title: 'Drugs',

      image: 'images/drugs.png',
    ),
    MyListItem(
      title: 'Tests',

      image: 'images/mcq.png',
    ),
    MyListItem(
      title: 'Atlas',

      image: 'images/atlas.png',
    ),
    MyListItem(
      title:  'Videos',

      image: 'images/video.png',
    ),
    MyListItem(
      title:  'Quizzes',

      image: 'images/mcq.png',
    ),
    MyListItem(
      title:  'Case Studis',

      image: 'images/case-study.png',
    ),
    MyListItem(
      title:  'Consultants',
      image: 'images/consultant.png',
    ),

  ];
}

class MyListItem {
  final String title;
  final String image;


  MyListItem({required this.title, required this.image,});
}