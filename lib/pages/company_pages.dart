import 'package:aiataf/provider/company_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../helper/brand_database_helper.dart';
import '../../../../models/brands_models.dart';
import '../../../../models/company_model.dart';
import '../../../../services/brands_services.dart';
import '../../../../services/companies_service.dart';
import '../helper/company_helper.dart';

class CompanyItemWidget extends StatefulWidget {
  const CompanyItemWidget({super.key});

  @override
  State<CompanyItemWidget> createState() => _CompanyItemWidgetState();
}

class _CompanyItemWidgetState extends State<CompanyItemWidget> {
  // List<CompanyData>? data;
  List<CompanyData>? dataCompanyData;

  // BrandServices brandServices = BrandServices();
  ComapanyServices companyServices = ComapanyServices();
  int _counter = 0;
  void _incrementCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _counter += 1000;
    await prefs.setInt('counter', _counter);
    print("counter----->${_counter}");
  }

  getBrand() async {
    dataCompanyData = await companyServices.getCompany(context, _counter);
    setState(() {});
  }

  // getComapany() async {
  //   dataCompanyData = await companyServices.getCompany(context);
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState

    getBrand();
    // getComapany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dataCompanyData == null
        ? Text("No data available")
        : Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Consumer<CompanyProvider>(builder: (context, provider, child) {
                  return SizedBox(
                      height: 800,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.allCompany.length,
                          itemBuilder: (context, index) {
                            final data = provider.allCompany[index];
                            return Container(
                              child: ListTile(
                                title: Text("${data.name}"),

                              ),
                            );
                          })

                      // ListView.builder(
                      //     scrollDirection: Axis.vertical,
                      //     shrinkWrap: true,
                      //     itemCount: dataCompanyData!.length,
                      //     itemBuilder: (context, index) {
                      //       final dataa = dataCompanyData![index];
                      //       // final dataaCompany = dataCompanyData![index];
                      //       return Container(
                      //         padding: EdgeInsets.all(4),
                      //         margin: EdgeInsets.all(5),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: Colors.white70),
                      //         child: ListTile(
                      //           onTap: () {
                      //             ItemDbHelper.dbHelper.insertNewRecipe(dataa);
                      //           },
                      //           title: RichText(
                      //             text: TextSpan(
                      //                 text: "${dataa.name}",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontWeight: FontWeight.w400,
                      //                     fontSize: 25),
                      //                 children: [
                      //                   TextSpan(
                      //                       text: "  ${dataa.name}",
                      //                       style: TextStyle(
                      //                         color: Colors.black54,
                      //                         fontSize: 12,
                      //                       ))
                      //                 ]),
                      //           ),
                      //           // subtitle: dataCompanyData==null?Text("No data avaialbe") :Text("${dataaCompany.name}"),
                      //           trailing: Text(
                      //             "${dataa.id}",
                      //             style: TextStyle(fontSize: 18),
                      //           ),
                      //         ),
                      //       );
                      //     }),
                      );
                }),
              ],
            ),
          );
  }
}
