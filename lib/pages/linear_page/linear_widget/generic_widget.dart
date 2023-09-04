import 'package:aiataf/helper/generic_database.dart';
import 'package:flutter/material.dart';

import '../../../models/generic_model.dart';
import '../../../services/generic_service.dart';

class GenericWidget extends StatefulWidget {
  const GenericWidget({super.key});

  @override
  State<GenericWidget> createState() => _GenericWidgetState();
}

class _GenericWidgetState extends State<GenericWidget> {
  List<GenericData>? genericData;

  GenericService genericService = GenericService();

  getGeneric() async {
    genericData = await genericService.getGeneric(context);
    setState(() {});
  }

  // getComapany() async {
  //   dataCompanyData = await companyServices.getCompany(context);
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    getGeneric();
    // getComapany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return genericData == null
        ? Center(
            child: Text(
              "No data ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : SizedBox(
            height: 500,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: genericData!.length,
                itemBuilder: (context, index) {
                  final gen = genericData![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [

                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              InkWell(
                                onTap:(){
                                  GenericDbHelper.dbHelper.insertNewRecipe(gen);

                                },
                                child: Container(height: 50,width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                             borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(5),
                                 topRight: Radius.circular(5)
                             )
                                ),


                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("${gen.name}"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
  }
}
