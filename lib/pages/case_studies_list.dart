import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/search_widget.dart';

class CaseStudiesList extends StatelessWidget {
  const CaseStudiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text("Case Studies List",style: TextStyle(color: Colors.black38),),
        backgroundColor: Color(0xffEBE5D9),
        
        
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.notification_add_outlined,color: Colors.black38,),
                SizedBox(width: 2,),
                Icon(Icons.ac_unit,color: Colors.black38,)
              ],
            ),
          )
        ],
      ),
      
      
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(
                padding: EdgeInsets.all(10),


                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    // suffixIcon:
                    //     Icon(Icon,color: Colors.black38,),

                        // Size(width, height)



                    hintStyle: TextStyle(
                        color: Color(0xff516E95), fontSize: 12),


                    hintText: "Case Name",
                    fillColor: Color(0xffFCFCFC),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),



              // const SearchWidget(),
              const SizedBox(height: 10,),
              const Text("SkinVd Clinal Team"),

              const SizedBox(height: 10,),
              const Text("Shiny,waxy Papules on face and extremiites in a \n female with dyspnea",
              style: TextStyle(
                fontWeight: FontWeight.bold,

              ),),
              const SizedBox(height: 10,),

              const Text("A 40-years-old woman prested with asymptomatic \n pinkins red raised lession over face, neck, and upeer extermites since six months")
             ,Image.asset("images/welcome banner.png",
              height: 200,width: double.infinity,),

              Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text("1 comments"),
              ),

              Divider(color: Colors.white,thickness: 2,),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/like.svg',  // Replace with the path to your SVG asset
                        width: 18,  // Set the width of the icon
                        height: 18, // Set the height of the icon
                        color: Colors.blue, // Set the color of the icon (optional)
                      ),
                      SizedBox(width: 8,),
                      // SizedBox(width: 2,),
                      Text("Like",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)
                    ],
                  ),
                  // SizedBox(height: 20,),


                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/comment-solid.svg',  // Replace with the path to your SVG asset
                        width: 18,  // Set the width of the icon
                        height: 18, // Set the height of the icon
                        color: Colors.blue, // Set the color of the icon (optional)
                      ),
                      SizedBox(width: 8,),
                      // SizedBox(width: 2,),
                      Text("Comments",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/save.svg',  // Replace with the path to your SVG asset
                        width: 18,  // Set the width of the icon
                        height: 18, // Set the height of the icon
                        color: Colors.blue, // Set the color of the icon (optional)
                      ),
                      SizedBox(width: 8,),
                      // SizedBox(width: 2,),
                      Text("Save",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),)
                    ],
                  ),








                ],
              ),
              SizedBox(height: 20,),
              Divider(thickness: 20,color: Colors.white,)

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
    );
  }
}
