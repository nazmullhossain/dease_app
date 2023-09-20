import 'package:aiataf/helper/company_helper.dart';
import 'package:aiataf/helper/query/get_query.dart';
import 'package:aiataf/provider/brand_provider.dart';
import 'package:aiataf/provider/company_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  List<CompanyData>? dataCompany;
  List<Map<String, dynamic>>f=[];
  getCompany() async {
  f=await GetQuery().getAllData();
    
    // data = await brandServices.geBrand(context);
    print("brand length----------------->${data!.length}");
    setState(() {

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
    getCompany();
    // getComapany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Text("No data available")
        : Padding(
            padding: EdgeInsets.all(10),
            child: Consumer<RecipeClass>(

              builder: (context, provider, child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height*0.9,
                  child:     ListView.builder(
                      itemCount: f.length,
                      itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.all(3),
              
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: ListTile(
                        title: RichText(text: TextSpan(text: "${f[index]["name"]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.black),children: [
                          TextSpan(text: "${f[index]["strength"]}",style: TextStyle(fontSize: 8))
                        ]),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${f[index]['company_name']}"),
                          ],
                        ),
                        trailing: Text("${f[index]["form"]}"),
                      )

                      // Column(
                      //   children: [
                      //     Text("${f[index]['name']}"),
                      //     Text("company name${f[index]['company_name']}"),
                      //   ],
                      // ),
                    );
                  }),
                );
              }
            ),
          );
  }
}
