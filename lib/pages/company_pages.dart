import 'package:flutter/material.dart';

import '../helper/company_helper.dart';
import '../models/company_model.dart';
import '../services/companies_service.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {

  List<CompanyData>? companyData;

  ComapanyServices comapanyServices=ComapanyServices();

  getBrand()async{
    companyData=await comapanyServices.getCompany(context);
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getBrand();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Name"),

        centerTitle: true,
      ),


      body:companyData==null?Center(child: Text("No data"),): SingleChildScrollView(
        child: SizedBox(height: 600,child: ListView.builder(
          itemCount: companyData!.length,
            itemBuilder: (context,index){
  final    data=        companyData![index];

          return ListTile(
            onTap: (){
              CompanyDbHelper.dbHelper.insertNewRecipe(data);

            },
            title: Text("${data.name}"),

          );
        }),),
      ),
    );
  }
}
