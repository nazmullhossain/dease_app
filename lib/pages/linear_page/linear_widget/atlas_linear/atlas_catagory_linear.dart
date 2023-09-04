import 'package:flutter/material.dart';

class AtlasCatagoryLinear extends StatelessWidget {
  const AtlasCatagoryLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        title: Text("Atlas Category"),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
                color: Colors.white
              ),
              child: ListTile(
                title: Text("Acanthosis Nigricans",style: TextStyle(
                    color: Colors.blue.withOpacity(0.9),fontSize: 20),),
                subtitle: Text("9 atlas",style: TextStyle(fontSize: 15,color: Colors.blue.withOpacity(01)),),


                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_left)),


              ),


            );
          })
        ),
      ),
    );
  }
}
