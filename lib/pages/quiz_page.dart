import 'package:flutter/material.dart';

import '../const/global_const.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,


      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
        leading: Icon(Icons.arrow_left_outlined),

        title: Text("Quiz List"),
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 490,

            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.symmetric(
                horizontal: 10,
                  vertical: 5
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(
                  title: Text("10 Picture Quizzes",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),

                  subtitle: Text("10 Picture Quizzes"),


                  trailing: Container(
                    child: Icon(Icons.arrow_left_outlined),
                  ),


                ),
              );
            }),
            ),

            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fast Picture Quiz",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                      Text("Fast Picture Quiz",style: TextStyle(

                        fontSize: 10
                      ),)
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Text("Completed",style:  TextStyle(
                      color: Colors.blueAccent
                    )
                      ),
                  )

                ],
              ),

            )
          ],
        ),
      ),

    );
  }
}
