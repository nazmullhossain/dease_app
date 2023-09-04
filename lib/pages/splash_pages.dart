import 'dart:convert';

import 'package:aiataf/pages/home_pages.dart';
import 'package:aiataf/widget/bottom_bar_widget.dart';

import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';

import '../helper/brand_database_helper.dart';
import '../models/brands_models.dart';
import '../models/company_model.dart';
import '../services/brands_services.dart';
import '../services/companies_service.dart';
import '../utils/utilss.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late int counter;
  late double percent;
  String percentLoad = "";
  bool _isConnected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = 0;
    percent = 0;
    getBrand();
    // getCompany();
  }

  // ignore: non_constant_identifier_names
  // void AddDataToDatabase() async{
  //   if (!await isNetworkAvailable()) {
  //     showSnackBar(context, "NO Connneciton");
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (_) => const HomePage()));
  //
  //   }else{
  //  showSnackBar(context, "Connneciton Ok");
  //     DatabaseHelper _dbHelper = DatabaseHelper.instance;
  //     List<DataModel> _blogs = await _dbHelper.fetchDatas();
  //     setState(() {
  //       _isConnected = true;
  //       counter = 0;
  //
  //     });

  List<Data>? dataa;
  List<CompanyData>? dataaCompanyData;


  BrandServices brandServices = BrandServices();
  ComapanyServices comapanyServices=ComapanyServices();

  getBrand() async {
    dataa = await brandServices.geBrand(context);

    if (!await isNetworkAvailable()) {
      showSnackBar(context, "your internet connection done");

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const BottomBarWidget()));
    } else {
      if (dataa != null) {
        for (Data data in dataa!) {
          // await _dbHelper.getOneData(data.id!);
          DbHelper.dbHelper.insertNewRecipe(data);



          setState(() {
            counter = counter + 1;
            percent = ((counter / dataa!.length) * 100);
          });
          print("parcentent------------------->${percent}");

          if (percent == 100.0) {
            Future.delayed(Duration(seconds: 4), () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => BottomBarWidget()));
            });
          }
        }
      }
    }
  }
  // getCompany() async {
  //   dataaCompanyData = await comapanyServices.getCompany(context);
  //
  //   if (!await isNetworkAvailable()) {
  //     showSnackBar(context, "your internet connection done");
  //
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (_) => const BottomBarWidget()));
  //   } else {
  //     if (dataaCompanyData != null) {
  //       for (CompanyData data in dataaCompanyData!) {
  //         // await _dbHelper.getOneData(data.id!);
  //         CompanyDbHelper.dbHelper.insertNewRecipe(data!);
  //
  //
  //
  //         setState(() {
  //           counter = counter + 1;
  //           percent = ((counter / dataa!.length) * 100);
  //         });
  //         print("parcentent------------------->${percent}");
  //
  //         if (percent == 100.0) {
  //           Future.delayed(Duration(seconds: 4), () {
  //             Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(builder: (context) => BottomBarWidget()));
  //           });
  //         }
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("  "),
        leading: Container(),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircularProgressIndicator(
            //   valueColor:
            //       AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            // ),

            Text("Retrieval and storage of data in the application database${  percent}%"),
            if (_isConnected)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Retrieval and storage of data in the application database $percentLoad",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
