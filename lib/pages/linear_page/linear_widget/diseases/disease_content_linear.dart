import 'package:flutter/material.dart';

import 'acanthosis_nirgricans_disease.dart';

class DiseaseContentLinear extends StatelessWidget {
  const DiseaseContentLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text("Diseases Content"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(225, 50, 54, 56),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    border: InputBorder.none,
                    hintText: "Search by brand name",
                    hintStyle:
                    TextStyle(color: Colors.white.withOpacity(0.5))),
              ),
            ),

            SizedBox(height: 10,),
      SizedBox(
        height: 500,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (context, index) {
              // final gen = genericData![index];
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
                              // GenericDbHelper.dbHelper.insertNewRecipe(gen);


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

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AcanthosisDisease()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Acanthosis Nigricans"),
                            ),
                          ),
                        ],
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
