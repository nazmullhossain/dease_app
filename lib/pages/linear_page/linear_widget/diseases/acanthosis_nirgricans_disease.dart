import 'package:flutter/material.dart';

class AcanthosisDisease extends StatelessWidget {
  const AcanthosisDisease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Acanthosis Nigricans"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        Padding(
          padding: const EdgeInsets.only(top: 18,right: 5),
          child: Text(
                "All Images",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                color: Colors.black38,
                child: Center(child: Text("OVERVIEW",style: TextStyle(color: Colors.white,),)),

              ),
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
