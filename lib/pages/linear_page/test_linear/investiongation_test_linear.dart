
import 'package:aiataf/models/Investigation_model.dart';
import 'package:aiataf/services/investiongation_service.dart';
import 'package:flutter/material.dart';

import '../linear_widget/diseases/disease_content_linear.dart';



class InvestigationList extends StatefulWidget {
  const InvestigationList({super.key});

  @override
  State<InvestigationList> createState() => _InvestigationListState();
}

class _InvestigationListState extends State<InvestigationList> {
  List<InvestigationData>?investigationData;
  InvestigationServices investigationServices=InvestigationServices();

  fetchData()async{
    investigationData=await investigationServices.getInvestigationServices(context);
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEBE5D9),
        title: Text("Investigation List"),
        centerTitle: true,
      ),
      body: investigationData==null?Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.9,
          child: ListView.builder(
              itemCount: investigationData!.length,
              itemBuilder: (context,index){
                final dat=investigationData![index];
                return Column(
                  children: [
                    // SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(bottom: 2,top: 4,left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF2EFE8),

                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DiseaseContentLinear()));
                        },
                        child: ListTile(

                          leading: Image.network("${dat.icon}"),
                          title: Text("${dat.name}"),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
                        ),
                      ),
                    ),
                  ],
                );

              }),
        ),
      ),
    );
  }
}
