import 'package:flutter/material.dart';

import '../const/global_const.dart';

import '../widget/search_widget.dart';
import '../widget/slider_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  margin: EdgeInsets.symmetric(horizontal: 10),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.sync),
                    RichText(
                        text: TextSpan(
                            text: "Last sync",
                            style: TextStyle(fontSize: 10),
                            children: [
                          TextSpan(
                              text: " 06/08/23",
                              style: TextStyle(
                                fontSize: 10,
                              ))
                        ]))
                  ],
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1,
              ),
              SliderScreen(),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    SearchWidget(),
                    SizedBox(
                      height: 175,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: GlobalVarriable.items.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    GlobalVarriable.items[index].image,
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(
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
                      SizedBox(
                        width: 2,
                      ),
                      Text(
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
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                  )
                ],
              ),

              SizedBox(
                height: 150,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
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
                          title: Text("Treatment of Seborheic Dermatis"),
                          subtitle: Text("American Familly Physican(AFp)"),
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
            ],
          ),
        ));
  }
}
