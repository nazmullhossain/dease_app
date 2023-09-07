
import 'package:aiataf/models/diseases_model.dart';
import 'package:aiataf/services/diseases_service.dart';
import 'package:flutter/material.dart';



import 'disease_content_linear.dart';

class DieasesListWidget extends StatefulWidget {
  const DieasesListWidget({super.key});

  @override
  State<DieasesListWidget> createState() => _DieasesListWidgetState();
}

class _DieasesListWidgetState extends State<DieasesListWidget> {
List<DiseasesData>?diseasesData;

   DiseasesServices diseasesServices = DiseasesServices();


  getBrand() async {
    diseasesData = await diseasesServices.getDiseasesServices(context);
    setState(() {});
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
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(

        backgroundColor: Color(0xffEBE5D9),
        title: Text("Diseasses List",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38),),
        centerTitle: true,
      ),
      body:diseasesData==null?Center(child: CircularProgressIndicator(
        color: Colors.amberAccent,
      ),) :SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.9,
            child: ListView.builder(
                itemCount: diseasesData!.length,
                itemBuilder: (context,index){
                  final datta=diseasesData![index];
              return Column(
                children: [
                  // SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(bottom: 2,top: 4,left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2EFE8),

                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DiseaseContentLinear(),settings: RouteSettings(
                          arguments: datta
                        )));
                      },
                      child: ListTile(

                        leading: Image.network("${datta.icon}"),
                        title: Text("${datta.name}"),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
                      ),
                    ),
                  ),
                ],
              );

            }),
          ),
        ),
      ),
    );
  }
}
