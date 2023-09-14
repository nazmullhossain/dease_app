import 'package:aiataf/models/case_model.dart';
import 'package:aiataf/pages/linear_page/case_studies_linear/case_studies_details_linear.dart';
import 'package:aiataf/pages/test_vsal.dart';
import 'package:aiataf/services/case_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../provider/brand_provider.dart';
import '../../../widget/search_widget.dart';

class CaseStudiesList extends StatefulWidget {
  const CaseStudiesList({super.key});

  @override
  State<CaseStudiesList> createState() => _CaseStudiesListState();
}

class _CaseStudiesListState extends State<CaseStudiesList> {
  List<CaseData>? caseData;
  CaseServices caseServices = CaseServices();

  fetchCaseData() async {
    caseData = await caseServices.getCaseServices(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Case Studies List",
          style: TextStyle(color: Colors.black38),
        ),
        backgroundColor: Color(0xffEBE5D9),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.notification_add_outlined,
                  color: Colors.black38,
                ),
                SizedBox(
                  width: 2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewProductScreen()));
                  },
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: caseData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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

                          hintStyle:
                              TextStyle(color: Color(0xff516E95), fontSize: 12),

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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ListView.builder(
                          itemCount: caseData!.length,
                          itemBuilder: (context, index) {
                            final dataa = caseData![index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CaseStudiesDetails(
                                              title: dataa.title.toString(),
                                              des: dataa.shortDesc.toString(),
                                              imag: dataa.thumbnail.toString(),
                                              like: dataa.totalLikes.toString(),
                                            )));
                              },
                              child: Column(
                                children: [
                                  Text("${dataa.user!.name}"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${dataa.title}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("${dataa.shortDesc}"),
                                  CachedNetworkImage(
                                    imageUrl: "${dataa.thumbnail}",
                                    placeholder: (context, url) =>
                                        new CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 20),
                                    alignment: Alignment.centerRight,
                                    child:
                                        Text("comment ${dataa.totalComments}"),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                    thickness: 2,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'images/like.svg', // Replace with the path to your SVG asset
                                            width:
                                                18, // Set the width of the icon
                                            height:
                                                18, // Set the height of the icon
                                            color: Colors
                                                .blue, // Set the color of the icon (optional)
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          // SizedBox(width: 2,),
                                          Text(
                                            "Like",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                      // SizedBox(height: 20,),

                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'images/comment-solid.svg', // Replace with the path to your SVG asset
                                            width:
                                                18, // Set the width of the icon
                                            height:
                                                18, // Set the height of the icon
                                            color: Colors
                                                .blue, // Set the color of the icon (optional)
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          // SizedBox(width: 2,),
                                          Text(
                                            "Comments",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'images/save.svg', // Replace with the path to your SVG asset
                                            width:
                                                18, // Set the width of the icon
                                            height:
                                                18, // Set the height of the icon
                                            color: Colors
                                                .blue, // Set the color of the icon (optional)
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          // SizedBox(width: 2,),
                                          Text(
                                            "Save",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    thickness: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // settingModalBottomSheet(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewProductScreen()));

        },
        child: Icon(Icons.add),
      ),
    );
  }

  String catgories = "Skin";
  List<String> productCategories = [
    "Skin",
    "Oral Mucosa",
  ];

  settingModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      // isScrollControlled: true,

      // set this when inner content overflows, making RoundedRectangleBorder not working as expected
      // clipBehavior: Clip.antiAlias,
      // set shape to make top corners rounded
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (context) {
        return Consumer<RecipeClass>(

          builder: (context, provider, child) {
            return Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "Title"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Title"),
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
            );
          }
        );
      },
    );
  }
}
