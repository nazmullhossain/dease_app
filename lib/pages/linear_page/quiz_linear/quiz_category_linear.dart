import 'package:flutter/material.dart';

class QuizCatagoryLinear extends StatelessWidget {
  const QuizCatagoryLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Quiz Category"),
        centerTitle: true,


      ),
      body: SingleChildScrollView(
        child: SizedBox(height: 600,

        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context,index){


          return Container(
            margin: EdgeInsets.all(5),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)

            ),
            child: ListTile(
              title: Text("Skin"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
            ),


          );

        }),
        ),
      ),
    );
  }
}
