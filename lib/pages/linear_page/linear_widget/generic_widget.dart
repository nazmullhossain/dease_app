import 'package:aiataf/helper/generic_database.dart';
import 'package:flutter/material.dart';

import '../../../models/generic_model.dart';
import '../../../services/generic_service.dart';
import 'diseases/acanthosis_nirgricans_disease.dart';

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
            child: CircularProgressIndicator(


            ),
          )
        :   SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: genericData!.length,
          itemBuilder: (context, index) {
            final dList = genericData![index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 8, right: 8),
                    child: Container(
                      width: double.infinity
                      // ,padding: EdgeInsets.all(8),
                      // margin: EdgeInsets.all(5),
                      ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              // GenericDbHelper.dbHelper.insertNewRecipe(gen);
                            },
                            child: Container(
                              height: 60,
                              width: 7,
                              decoration: const BoxDecoration(
                                  color: Color(0xff0EBBBB),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AcanthosisDisease()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, top: 15, bottom: 5),
                              child: Text("${dList.name}"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
