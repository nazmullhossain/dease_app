import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaseStudiesDetails extends StatefulWidget {
  CaseStudiesDetails(
      {super.key,
      required this.title,
      required this.des,
      required this.imag,
      required this.like});
  String title, des, imag, like;

  @override
  State<CaseStudiesDetails> createState() => _CaseStudiesDetailsState();
}

class _CaseStudiesDetailsState extends State<CaseStudiesDetails> {
  String catgories = "Mobiles";
  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "AppLiances0",
    "Books",
    "Fashion"
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEBE5D9),
        title: Text("Case Studies"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(widget.title),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(widget.imag))
                ],
              ),
              Text(widget.des),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/like.png', // Replace with the path to your SVG asset
                        width: 25, // Set the width of the icon
                        height: 25, // Set the height of the icon
                        color:
                            Colors.blue, // Set the color of the icon (optional)
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      // SizedBox(width: 2,),
                      Text(
                        "${widget.like} Like",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  // SizedBox(height: 20,),

                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/comment-solid.svg', // Replace with the path to your SVG asset
                        width: 18, // Set the width of the icon
                        height: 18, // Set the height of the icon
                        color:
                            Colors.blue, // Set the color of the icon (optional)
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      // SizedBox(width: 2,),
                      Text(
                        "Comments",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/save.svg', // Replace with the path to your SVG asset
                        width: 18, // Set the width of the icon
                        height: 18, // Set the height of the icon
                        color:
                            Colors.grey, // Set the color of the icon (optional)
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      // SizedBox(width: 2,),
                      Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),


    Row(
      children: [
        SizedBox(
          height: 60,
          width: 340,
          child: Container(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 10,
              child: TextField(
                decoration: InputDecoration(


                  hintStyle:
                  TextStyle(color: Color(0xff516E95), fontSize: 12),

                  hintText: "Write a comment",
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
          ),
        ),
        Icon(Icons.send)
      ],
    ),

              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: catgories,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: productCategories.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      catgories = newVal!;
                    });
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
