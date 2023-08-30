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

  getBrand() async {
    data = await brandServices.geBrand(context);
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
    return data == null
        ? Text("No data available")
        : Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 800,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data!.length ,
                  itemBuilder: (context, index) {
                    final dataa = data![index];
                    // final dataaCompany = dataCompanyData![index];
                    return Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70),
                      child: ListTile(
                        onTap: (){
                          DbHelper.dbHelper.insertNewRecipe(dataa);
                        },
                        title: RichText(
                          text: TextSpan(
                              text: "${dataa.name}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
                              children: [
                                TextSpan(

                                    text: "  ${dataa.strength}",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12,))
                              ]),
                        ),
                        // subtitle: dataCompanyData==null?Text("No data avaialbe") :Text("${dataaCompany.name}"),
                        trailing: Text("${dataa.form}",style: TextStyle(fontSize: 18),),
                      ),
                    );
                  }),
            ),
          );
  }
}
