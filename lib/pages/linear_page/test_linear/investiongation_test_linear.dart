
import 'package:flutter/material.dart';

import '../linear_widget/diseases/disease_content_linear.dart';



class InvestigationList extends StatelessWidget {
  const InvestigationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        backgroundColor: Color(0xffEBE5D9),
        title: Text("Investigation List"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    // SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(bottom: 2,top: 2,left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF2EFE8),

                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DiseaseContentLinear()));
                        },
                        child: ListTile(

                          leading: Image.asset(
                            "images/welcome banner.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text("Skin Disoders"),
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
