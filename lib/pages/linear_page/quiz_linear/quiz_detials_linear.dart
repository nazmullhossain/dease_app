import 'package:flutter/material.dart';

class QuizLinearDetails extends StatefulWidget {
  const QuizLinearDetails({super.key});

  @override
  State<QuizLinearDetails> createState() => _QuizLinearDetailsState();
}

class _QuizLinearDetailsState extends State<QuizLinearDetails> {
  String selectedValue="keloid";
  String newValue="keloid";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        backgroundColor: Color(0xffEBE5D9),
        centerTitle: true,
        elevation: 1,
        title: Text("Quiz",style: TextStyle(color: Colors.black),),

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 4),
            child: Text("Question",style: TextStyle(color: Colors.black),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("1/",style: TextStyle(color: Colors.black)),
                Text("10",style: TextStyle(color: Colors.black)),
              ],
            ),
          )
        ],

      ),

      body: SingleChildScrollView(
        child: Container(


          child:  Column(
            children: [
            SizedBox(height: 10,),
              Text("Which one is the most likely diagonis?"),
              SizedBox(height: 10,),
              Image.asset("images/skinVD-logo.png",height: 200,width: double.infinity,),



            ],
          ),
        ),
      ),
    );
  }
}
