import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VideoLinearList extends StatelessWidget {
  const VideoLinearList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Video List"),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              Container(
                color: Colors.white,
                height: 350,
                width: double.infinity,
                child: Column(
                  children: [
                    Text("Primary adn Secondary skin lesions"),
                    SizedBox(height: 5,),
                    Image.asset("images/welcome banner.png",height: 250,)
                    ,
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.cyan

                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.youtube_searched_for_outlined),
                            SizedBox(width: 3,),
                            Center(child: Text("Watch video"))
                          ],
                        ),
                      ),
                    )

                    
                    
                  ],
                ),
              )

            ],
          ),


        ),
      ),
    );
  }
}
