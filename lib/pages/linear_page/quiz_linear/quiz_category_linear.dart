import 'package:aiataf/models/quiz_model.dart';
import 'package:aiataf/pages/quiz_page.dart';
import 'package:aiataf/services/quiz_service.dart';
import 'package:flutter/material.dart';

class QuizCatagoryLinear extends StatefulWidget {
  const QuizCatagoryLinear({super.key});

  @override
  State<QuizCatagoryLinear> createState() => _QuizCatagoryLinearState();
}

class _QuizCatagoryLinearState extends State<QuizCatagoryLinear> {

  List<QuizData>?quizData;

  QuizServices quizServices=QuizServices();

  fetchQuizList()async{
    quizData=await quizServices.getQuizServices(context);
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchQuizList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        backgroundColor: Color(0xffEBE5D9),
        elevation: 1,
        title: Text("Quiz Category"),
        centerTitle: true,


      ),
      body:quizData==null?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: SizedBox(height: 600,

        child: ListView.builder(
            itemCount: quizData!.length,
            itemBuilder: (context,index){
              final quiz=quizData![index];


          return Container(
            margin: EdgeInsets.only(top: 5,left: 8,right: 8),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)

            ),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
              },
              child: ListTile(
                title: Text("${quiz.name}"),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
              ),
            ),


          );

        }),
        ),
      ),
    );
  }
}
