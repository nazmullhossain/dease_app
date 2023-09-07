import 'package:aiataf/models/atlas_catagory_model.dart';
import 'package:aiataf/services/atlas_catagory_service.dart';
import 'package:flutter/material.dart';

class AtlasCatagoryLinear extends StatefulWidget {
  const AtlasCatagoryLinear({super.key});

  @override
  State<AtlasCatagoryLinear> createState() => _AtlasCatagoryLinearState();
}

class _AtlasCatagoryLinearState extends State<AtlasCatagoryLinear> {
  List<AtlasCatagoryData>?atlasCatagoryData;

  AtlasCatagoryServices atlasCatagoryServices=AtlasCatagoryServices();

  fetchAtlasCatagory()async{
    atlasCatagoryData=await atlasCatagoryServices.getAtlasCatagoryServices(context);
    setState(() {

    });
  }

@override
  void initState() {
    // TODO: implement initState
  fetchAtlasCatagory();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Atlas Category",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffEBE5D9),
        centerTitle: true,
      ),
      body:atlasCatagoryData==null?Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
        child: SizedBox(
            height: 800,
            child: ListView.builder(
                itemCount: atlasCatagoryData!.length,
                itemBuilder: (context, index) {
         final     dataa  = atlasCatagoryData![index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffF7F1F1)),
                      child: ListTile(
                        title: Text(
                          "${dataa.name}",
                          style:
                              TextStyle(color: Color(0xff334F5D), fontSize: 20),
                        ),
                        subtitle: Text(
                          "${dataa.id} atlas",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff016868)),
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
