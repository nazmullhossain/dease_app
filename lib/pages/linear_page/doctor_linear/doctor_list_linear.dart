import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../models/doctor_list_model.dart';
import '../../../services/doctor_list_service.dart';
import '../../../widget/search_widget.dart';
import '../../doctor_detils_pages.dart';

class DoctorListLinear extends StatefulWidget {
  const DoctorListLinear({super.key});

  @override
  State<DoctorListLinear> createState() => _DoctorListLinearState();
}

class _DoctorListLinearState extends State<DoctorListLinear> {
  List<DoctorListData>? doctorListData;
  DoctorListService doctorListService=DoctorListService();
   List<DoctorListData>? sqfDoctorList;

   List<DoctorListData>? recipes;
  List<DoctorListData> filteredRecipes = [];

  void filterRecipes(value) {
    setState(() {
   sqfDoctorList = recipes!
          .where((recipe) =>
          recipe.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    fetchDoctorList();
    super.initState();
  }
  fetchDoctorList()async{
    doctorListData=await doctorListService.getDoctorList(context);
    setState(() {

    });
  }
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
      body: doctorListData==null?Center(child: Text("No Doctor List available"),) :  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),


                child: TextField(
                  onChanged: (value){
                    filterRecipes(value);

                  },

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(
                        color: Color(0xff516E95), fontSize: 12),


                    hintText: "Enter your doctor name",
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

              SizedBox(height: 600,child: ListView.builder(
                  itemCount: doctorListData!.length,
                  itemBuilder: (context,index){
               final doctor=     doctorListData![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DoctorDetailsPage(title: doctor.title.toString(), name: doctor.name.toString(), img: doctor.doctorPhoto.toString(), qualification: doctor.qualification.toString(),)));
                    },
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
                 color: const Color(0xffF2EFE8),
                          child: ListTile(
                            leading:    Image.asset("images/consultant.png",width: 50,height: 50,),
                            title: Text(" ${doctor.title}${doctor.name}",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                            subtitle: Column(
                              children: [
                                Text("${doctor.qualification}",style: TextStyle(color: Colors.black),)
                              ],
                            ),

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
