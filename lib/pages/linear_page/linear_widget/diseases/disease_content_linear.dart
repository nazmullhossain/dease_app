import 'package:aiataf/models/diseas_list_model.dart';
import 'package:aiataf/services/disease_list_service.dart';
import 'package:aiataf/widget/search_widget.dart';
import 'package:flutter/material.dart';

import 'acanthosis_nirgricans_disease.dart';

class DiseaseContentLinear extends StatefulWidget {
  const DiseaseContentLinear({super.key});

  @override
  State<DiseaseContentLinear> createState() => _DiseaseContentLinearState();
}

class _DiseaseContentLinearState extends State<DiseaseContentLinear> {
  DiseasesListServices diseasesListServices = DiseasesListServices();
  List<DListData>? disListData;

  fetchDlistData() async {
    disListData = await diseasesListServices.getDiseasesServices(context);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchDlistData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        backgroundColor: Color(0xffEBE5D9),
        elevation: 1,
        title: Text(
          "Diseases Content",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:disListData ==null?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(hintText: "Search by content"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    final dList = disListData![index];
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
            )
          ],
        ),
      ),
    );
  }
}
