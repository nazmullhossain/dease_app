import 'package:aiataf/helper/brand_database_helper.dart';
import 'package:aiataf/models/brands_models.dart';
import 'package:aiataf/models/company_model.dart';
import 'package:aiataf/models/derma_update_model.dart';
import 'package:aiataf/pages/quiz_page.dart';
import 'package:aiataf/services/drema_update_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/global_const.dart';

import '../provider/company_provider.dart';
import '../services/brands_services.dart';
import '../services/companies_service.dart';
import '../widget/search_widget.dart';
import '../widget/slider_widget.dart';
import 'linear_page/case_studies_linear/case_studies_list.dart';
import 'linear_page/doctor_linear/doctor_list_linear.dart';
import 'linear_page/drug_linnear_page.dart';
import 'linear_page/linear_widget/atlas_linear/atlas_catagory_linear.dart';
import 'linear_page/linear_widget/diseases/diseases_list_linear_widget.dart';
import 'linear_page/quiz_linear/quiz_category_linear.dart';
import 'linear_page/test_linear/investiongation_test_linear.dart';
import 'linear_page/video_linear/video_list_linear.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void navigateToSearchScreen(BuildContext context,String catagory) {
  //   Navigator.pushNamed(context, CategoryDealsScreen.routeName,arguments: catagory);
  // }

  List<DermaData>? data;

  String? dateString;
  bool _isPlaying = false;

  Future<void> saveDate(DateTime date) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("date", date.toIso8601String());
  }

  Future<DateTime?> getDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dateString = prefs.getString("date");
    print("data-------------->${dateString}");
    if (dateString != null) {
      return DateTime.tryParse(dateString!);
    }
    return null;
  }
  List<DermaData>?dermaData;

  DermaUpdateServices dermaUpdateServices = DermaUpdateServices();

  getCompany() async {
    dermaData = await dermaUpdateServices.getDermaServices(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getCompany();
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEBE5D9),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            elevation: 1,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Color(0xffEBE5D9),
                // gradient: GlobalVarriable.appBarGradiant
              ),
            ),
            title: Row(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset("images/skinVD-logo.png"),
                ),
                RichText(
                    text: const TextSpan(
                        text: "SkinVD",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0EBBBB)),
                        children: [
                      TextSpan(
                          text: " 1.03",
                          style: TextStyle(
                            fontSize: 10,
                          ))
                    ]))
              ],
            ),
            actions: [
              Consumer<CompanyProvider>(
                  builder: (BuildContext context, provider, Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            // provider.getRecipes();
                            // currentDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            // String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
                            saveDate(DateTime.now());
                            getDate();
                            setState(() {});
                            // DateFormat('yyyy-MM-dd').format(DateTime.now());
                            // DbHelper.dbHelper.insertNewRecipe(data as Data);
                          },
                          child: const Icon(
                            Icons.sync,
                            color: Color(0XFF7C8F92),
                          )),
                      RichText(
                          text: TextSpan(
                              text: "Last sync",
                              style: const TextStyle(
                                  fontSize: 5, color: Color(0xff7C8F92)),
                              children: [
                            TextSpan(
                                text: " ${dateString}",
                                style: const TextStyle(
                                    fontSize: 8, color: Color(0xff7C8F92)))
                          ]))
                    ],
                  ),
                );
              })
            ],
          ),
        ),
        body: dermaData == null
            ? const Center(
                child: Text("no data "),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SliderScreen(),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: const Color(0xffF2EFE8),
                      child: Column(
                        children: [
                          SearchWidget(
                            hintText: 'Search Brand/Diseases',
                          ),
                          SizedBox(
                            height: 175,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    GlobalVarriable.categoryImages.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 20,
                                        // mainAxisSpacing: 10,
                                        crossAxisCount: 4),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DieasesListWidget()));
                                      }
                                      if (index == 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DragLinearPage()));
                                      }

                                      if (index == 2) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InvestigationList()));
                                      }
                                      if (index == 3) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AtlasCatagoryLinear()));
                                      }
                                      if (index == 4) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const VideoLinearList()));
                                      }
                                      if (index == 5) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const QuizCatagoryLinear()));
                                      }
                                      if (index == 6) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CaseStudiesList(),
                                            ));
                                      }
                                      if (index == 7) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DoctorListLinear()));
                                      }
                                    },

                                    // navigateToSearchScreen(context,
                                    //     GlobalVarriable.categoryImages[index]["title"] as MyListItem)
                                    // >navigateToCategoryPage(context, GlobalVariables.categoryImages[index]['title']!),

                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            GlobalVarriable.items[index].image,
                                            width: 30,
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            GlobalVarriable.items[index].title,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "images/investigations.png",
                                height: 49,
                                width: 49,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text(
                                "Derma Update",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff1E3445),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),

                          // Container(
                          //
                          //   padding: EdgeInsets.all(10),
                          //   margin: EdgeInsets.only(right: 10),
                          //   decoration: BoxDecoration(
                          //
                          //       borderRadius: BorderRadius.circular(40),
                          //       boxShadow: [
                          //         BoxShadow(
                          //
                          //           color: Colors.white,
                          //           blurRadius: 1,
                          //           spreadRadius: 5,
                          //
                          //
                          //
                          //         )
                          //       ]
                          //   ),
                          //   child: Text("View All",style: TextStyle(fontWeight: FontWeight.bold),),
                          // )

                          // Material(
                          //
                          //
                          //   elevation: 5,
                          //
                          //
                          //   borderRadius: BorderRadius.circular(20),
                          //   color: Colors.white,
                          //   child: Text("View All",style: TextStyle(fontSize: 20),),
                          // )
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 10),
                          //   child: ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //
                          //           backgroundColor: Colors.white),
                          //       onPressed: () {},
                          //       child: const Text(
                          //         "View All",
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //         ),
                          //       )),
                          // )

                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffFCFCFC),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff29B0B0)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Scrollbar(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.5,
                        child: ListView.builder(
                            itemCount: dermaData!.length,
                            itemBuilder: (context, index) {
                              final prod = dermaData![index];
                              return Container(
                                padding: EdgeInsets.all(20),
                                margin:
                                    EdgeInsets.only(left: 8, right: 8, top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                    color: Color(0XFFF2EFE8)),
                                child: ListTile(
                                  leading:  CachedNetworkImage(
                                    imageUrl: "${prod.image}",
                                    placeholder: (context, url) => new CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => new Icon(Icons.error),
                                  ),
                                  title: Text("${prod.title}",style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: const Text(
                                      "American Familly Physican(AFp)"),
                                ),
                              );
                            }),
                      ),
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color:
                    //   ),
                    // )

                  ],
                ),
              ));
  }
}
