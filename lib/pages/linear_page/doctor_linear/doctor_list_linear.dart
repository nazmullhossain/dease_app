import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../widget/search_widget.dart';

class DoctorListLinear extends StatelessWidget {
  const DoctorListLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEBE5D9),
        title: Text("Doctor's List",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
              SearchWidget(hintText: 'Search Doctor Name',),

              SizedBox(height: 600,child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DottedBorder(

                    borderType: BorderType.RRect,
                    dashPattern: [10, 4],
                    strokeCap: StrokeCap.round,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        // margin: EdgeInsets.all(1),
                        height: 100,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.9),
                        child: ListTile(
                          leading:    Image.asset("images/consultant.png",width: 50,height: 50,),
                          title: Text("Prof. Dr. Md. Samiul Haque",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          subtitle: Column(
                            children: [
                              Text("MBBS.DD(UK),MSC(UK)",style: TextStyle(color: Colors.white),)
                            ],
                          ),

                        ),
                      ),
                    ),
                  ),
                );
              }),)

            ],
          ),
        ),
      ),
    );
  }
}
