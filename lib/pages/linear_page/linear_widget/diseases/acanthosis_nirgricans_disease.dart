import 'package:flutter/material.dart';

class AcanthosisDisease extends StatelessWidget {
  const AcanthosisDisease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4EEE2),
      appBar: AppBar(
        backgroundColor: Color(0xffF4EEE2),
        elevation: 0,
        title: Text("Acanthosis Nigricans",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Color(0xff0EBBBB),)),
        Padding(
          padding: const EdgeInsets.only(top: 18,right: 5),
          child: Text(
                "All Images",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
        ),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 40,

                width: double.infinity,
                color:Color(0xffE8CCA4),
                child: Center(child: Text("TREATMENTS",style: TextStyle(color: Color(0xff252021),fontWeight: FontWeight.bold),)),

              ),
              SizedBox(height: 10,),
              Text("Acanthosis nigircan(AN) is characterised by \n hyperingmention and verlvety papillomatous \n thikening of the edpdermis predomintaly afftenging  the neck and flexures , particalury lthe axillae , grions , infrmammeryn regions, and the neck")

            ,Image.asset("images/skinVD-logo.png",width: double.infinity,height: 500,),
              Text("There are numerso cususe jof An, Whick may acoccour in isolation or in combinantion")

            ],
          ),
        ),
      ),
    );
  }
}
