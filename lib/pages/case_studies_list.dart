import 'package:flutter/material.dart';

import '../widget/search_widget.dart';

class CaseStudiesList extends StatelessWidget {
  const CaseStudiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case Studies List"),
        
        
        actions: [
          Row(
            children: [
              Icon(Icons.notification_add_outlined),
              Icon(Icons.ac_unit)
            ],
          )
        ],
      ),
      
      
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              SizedBox(height: 10,),
              Text("SkinVd Clinal Team"),

              SizedBox(height: 10,),
              Text("Shiny,waxy Papules on face and extremiites in a \n female with dyspnea",
              style: TextStyle(
                fontWeight: FontWeight.bold,

              ),),
              SizedBox(height: 10,),

              Text("A 40-years-old woman prested with asymptomatic \n pinkins red raised lession over face, neck, and upeer extermites since six months")
             ,Image.asset("images/welcome banner.png",
              height: 250,width: double.infinity,)

            ],
          ),
        ),
      ),
    );
  }
}
