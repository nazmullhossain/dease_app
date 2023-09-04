
import 'package:flutter/material.dart';

import '../generic_widget.dart';
import 'disease_content_linear.dart';

class DieasesListWidget extends StatelessWidget {
  const DieasesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Diseasses List"),
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
                    color: Colors.white,

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
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right)),
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
