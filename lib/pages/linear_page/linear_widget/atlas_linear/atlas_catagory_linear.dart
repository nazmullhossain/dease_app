import 'package:flutter/material.dart';

class AtlasCatagoryLinear extends StatelessWidget {
  const AtlasCatagoryLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        elevation: 1,
        title: Text("Atlas Category",style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xffEBE5D9),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800,
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(top: 4,left: 8,right: 8),
              child: Container(
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),

                  color: Color(0xffF7F1F1)
                ),
                child: ListTile(
                  title: Text("Acanthosis Nigricans",style: TextStyle(
                      color: Color(0xff334F5D),fontSize: 20),),
                  subtitle: Text("9 atlas",style: TextStyle(fontSize: 15,color: Color(0xff016868)),),


                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),


                ),


              ),
            );
          })
        ),
      ),
    );
  }
}
