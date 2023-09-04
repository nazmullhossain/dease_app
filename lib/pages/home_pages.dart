import 'package:aiataf/helper/brand_database_helper.dart';
import 'package:aiataf/models/brands_models.dart';
import 'package:aiataf/models/company_model.dart';
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

  List<CompanyData>? data;

  String? dateString;

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

  ComapanyServices brandServices = ComapanyServices();

  getCompany() async {
    data = await brandServices.getCompany(context);
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
        backgroundColor: Colors.grey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(gradient: GlobalVarriable.appBarGradiant),
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
                    text: TextSpan(
                        text: "SkinVD",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          child: Icon(Icons.sync)),
                      RichText(
                          text: TextSpan(
                              text: "Last sync",
                              style: TextStyle(fontSize: 5),
                              children: [
                            TextSpan(
                                text: " ${dateString}",
                                style: TextStyle(
                                  fontSize: 8,
                                ))
                          ]))
                    ],
                  ),
                );
              })
            ],
          ),
        ),
        body: data == null
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
                      child: Column(
                        children: [
                          const SearchWidget(),
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
                                                    VideoLinearList()));
                                      }
                                      if (index == 5) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    QuizCatagoryLinear()));
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
                                            style: TextStyle(
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
                    Row(
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
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            final prod = data![index];
                            return Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: ListTile(
                                leading: Image.asset(
                                  "images/welcome banner.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text("${prod.name}"),
                                subtitle: const Text(
                                    "American Familly Physican(AFp)"),
                              ),
                            );
                          }),
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color:
                    //   ),
                    // )
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ));
  }
}
