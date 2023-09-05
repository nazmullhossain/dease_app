
import 'package:flutter/material.dart';

import '../generic_widget.dart';
import 'disease_content_linear.dart';

class DieasesListWidget extends StatelessWidget {
  const DieasesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(

        backgroundColor: Color(0xffEBE5D9),
        title: Text("Diseasses List",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
          child: SizedBox(
            height: 600,
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
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
      ),
    );
  }
}
