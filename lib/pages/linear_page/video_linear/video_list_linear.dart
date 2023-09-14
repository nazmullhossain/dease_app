import 'package:aiataf/models/video_model.dart';
import 'package:aiataf/services/video_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoLinearList extends StatefulWidget {
  const VideoLinearList({super.key});

  @override
  State<VideoLinearList> createState() => _VideoLinearListState();
}

class _VideoLinearListState extends State<VideoLinearList> {
  VideoServices videoServices=VideoServices();
  List<VideoData>?videoData;

  fetchVideo()async{
    videoData=await videoServices.getVideoServices(context);
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        backgroundColor: Color(0xffEBE5D9),
        elevation: 0,
        title: Text("Video List"),
        centerTitle: true,

      ),
      body:videoData==null?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.9,
            child: ListView.builder(
                itemCount: videoData!.length,
                itemBuilder: (context,index){
                  final dataa=videoData![index];
              return Column(
                children: [

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    padding: EdgeInsets.all(10),

               
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                      
                    ),
                    height: 350,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text("${dataa.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        SizedBox(height: 5,),
                        Container(
                 
                          width: double.infinity,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Color(0xff0EBBBB),
                            borderRadius: BorderRadius.circular(5)
                          ),

                          child: CachedNetworkImage(
                            imageUrl: "${dataa.thumbnail}",
                            placeholder: (context, url) => new CircularProgressIndicator(),
                            errorWidget: (context, url, error) => new Icon(Icons.error),
                          ),
                        ),
                        SizedBox(height: 30,),


                        Container(
                          width: 250,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.cyan

                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("images/youtube.svg",width: 30,height: 30,color: Colors.red,),

                                SizedBox(width: 3,),
                                Center(child: Text("Watch video",style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),))
                              ],
                            ),
                          ),
                        )



                      ],
                    ),
                  )

                ],
              );

            }),
          ),


        ),
      ),
    );
  }
}
