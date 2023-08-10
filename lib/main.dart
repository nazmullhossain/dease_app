import 'package:aiataf/pages/home_pages.dart';
import 'package:aiataf/pages/quiz_page.dart';
import 'package:aiataf/widget/bottom_bar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: BottomBarWidget(),
    );
  }
}
