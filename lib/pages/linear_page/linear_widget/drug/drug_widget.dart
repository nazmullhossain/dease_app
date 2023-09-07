import 'package:flutter/material.dart';

import '../../../../helper/brand_database_helper.dart';
import '../../../../models/brands_models.dart';
import '../../../../models/company_model.dart';
import '../../../../services/brands_services.dart';
import '../../../../services/companies_service.dart';

class DrugItemWidget extends StatefulWidget {
  const DrugItemWidget({super.key});

  @override
  State<DrugItemWidget> createState() => _DrugItemWidgetState();
}

class _DrugItemWidgetState extends State<DrugItemWidget> {
  List<Data>? data;
  List<CompanyData>? dataCompanyData;

  BrandServices brandServices = BrandServices();
  ComapanyServices companyServices = ComapanyServices();
  int currentPage = 1;
  int itemsPerPage = 10;

  getBrand() async {
    data = await brandServices.geBrand(context);
    print("brand length----------------->${data!.length}");
    setState(() {
      // data!.addAll(newData);
      // currentPage++;
      // itemsPerPage++;
    });
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
    return data == null
        ? Text("No data available")
        : Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.9,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    final dataa = data![index];
                    // final dataaCompany = dataCompanyData![index];

                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 20,
                              offset: Offset(10, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white70),
                      child: ListTile(
                        onTap: () {
                          // DbHelper.dbHelper.insertNewRecipe(data.);
                        },
                        title: RichText(
                          text: TextSpan(
                              text: "${dataa.name}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
                              children: [
                                TextSpan(
                                    text: "  ${dataa.strength}",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ))
                              ]),
                        ),
                        // subtitle: dataCompanyData==null?Text("No data avaialbe") :Text("${dataaCompany.name}"),
                        trailing: Text(
                          "${dataa.form}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
          );
  }
}
