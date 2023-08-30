


import 'package:aiataf/pages/home_pages.dart';
import 'package:aiataf/pages/quiz_page.dart';
import 'package:aiataf/pages/splash_pages.dart';
import 'package:aiataf/provider/brand_provider.dart';
import 'package:aiataf/provider/company_provider.dart';
import 'package:aiataf/widget/bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/brand_database_helper.dart';
import 'helper/company_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ItemDbHelper.dbHelper.initDatabase();
  await DbHelper.dbHelper.initDatabase();



  runApp(MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (context)=>RecipeClass()),
        ChangeNotifierProvider(create: (context)=>CompanyProvider())
      ],
      
      
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
