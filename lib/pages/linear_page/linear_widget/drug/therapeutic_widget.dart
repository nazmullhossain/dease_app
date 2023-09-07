
import 'package:aiataf/models/therapeutic_model.dart';
import 'package:aiataf/pages/linear_page/linear_widget/diseases/acanthosis_nirgricans_disease.dart';
import 'package:aiataf/services/therapeutic_service.dart';
import 'package:flutter/material.dart';



class TherapeuticWidget extends StatefulWidget {
  const TherapeuticWidget({super.key});

  @override
  State<TherapeuticWidget> createState() => _TherapeuticWidgetState();
}

class _TherapeuticWidgetState extends State<TherapeuticWidget> {
  List<TherapeuticData>? therapeuticData;

  TherapeuticServices therapeuticServices = TherapeuticServices();

  getTherapeutic() async {
    therapeuticData = await therapeuticServices.gettherapeuticServices(context);
    setState(() {});
  }

  // getComapany() async {
  //   dataCompanyData = await companyServices.getCompany(context);
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    getTherapeutic();
    // getComapany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return therapeuticData == null
        ? Center(
      child: CircularProgressIndicator(


      ),
    )
        :   SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: therapeuticData!.length,
          itemBuilder: (context, index) {
            final tList = therapeuticData![index];
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
                              child: Text("${tList.name}"),
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
