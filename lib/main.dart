import 'package:aiataf/helper/disease_helper.dart';

import 'package:aiataf/pages/splash_pages.dart';
import 'package:aiataf/provider/brand_provider.dart';
import 'package:aiataf/provider/company_provider.dart';
import 'package:aiataf/provider/generic_provider.dart';
import 'package:aiataf/router.dart';
import 'package:aiataf/widget/bottom_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper/brand_database_helper.dart';
import 'helper/company_helper.dart';
import 'helper/doctor_helper.dart';
import 'helper/generic_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ItemDbHelper.dbHelper.initDatabase();
  await DbHelper.dbHelper.initDatabase();
  await GenericDbHelper.dbHelper.initDatabase();
  await DiseasesHelper.dbHelper.initDatabase();
  await DoctorHelper.dbHelper.initDatabase();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => RecipeClass()),
    ChangeNotifierProvider(create: (context) => CompanyProvider()),
    ChangeNotifierProvider(create: (context) => GenericProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = "";
  Future<String?> getTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    print("token  data${token}");
    setState(() {

    });
    return token;
  }

  @override
  void initState() {
    getTokenFromSharedPreferences();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: token.isEmpty ? SplashScreen() : BottomBarWidget(),
    );
  }
}
