
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../const/global_const.dart';
import '../pages/linear_page/case_studies_linear/case_studies_list.dart';
import '../pages/company_pages.dart';
import '../pages/home_pages.dart';
import '../pages/images_list_page.dart';
import '../pages/more_pages.dart';
import '../pages/quiz_page.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);
  static const String routeName="/bottom";
  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _page=0;
  double bottomBarWidth=42;
  double bottomBarBorderWidth=5;
  List<Widget> pageMain=[
    HomePage(),

    QuizPage(),

    ImageListPage(),

    MorePage()

  ];
  void updatePage(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: updatePage,
        selectedItemColor: GlobalVarriable.selectedNavBarColor,
        unselectedItemColor: GlobalVarriable.unSelectedNavBarColor,
        backgroundColor: GlobalVarriable.backGroundColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Container(
            width:bottomBarWidth ,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: _page==0?
                      GlobalVarriable.selectedNavBarColor
                          : GlobalVarriable.backGroundColor,
                      width: bottomBarBorderWidth,

                    )
                )
            ),
            child: Image.asset("images/home.png",height: 30,width: 25,),
          ),
              label: "Home"
              
          ),


          BottomNavigationBarItem(icon: Container(
            width:bottomBarWidth ,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: _page==1?
                      GlobalVarriable.selectedNavBarColor
                          : GlobalVarriable.backGroundColor,
                      width: bottomBarBorderWidth,

                    )
                )
            ),
            child: Icon(Icons.medical_information_sharp),
          ),
              label: "Skin Checker"
          ),




          BottomNavigationBarItem(icon: Container(
            width:bottomBarWidth ,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: _page==2?
                      GlobalVarriable.selectedNavBarColor
                          : GlobalVarriable.backGroundColor,
                      width: bottomBarBorderWidth,

                    )
                )
            ),
            child: Icon(Icons.notification_add),
          ),
              label: "Notification"
          ),
          BottomNavigationBarItem(icon: Container(
            width:bottomBarWidth ,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: _page==4?
                      GlobalVarriable.selectedNavBarColor
                          : GlobalVarriable.backGroundColor,
                      width: bottomBarBorderWidth,

                    )
                )
            ),
            child: Image.asset("images/more-options.png",height: 30,width: 25,),
          ),
              label: "More"
          ),








        ],
      ),
      body: pageMain[_page],
    );
  }
}