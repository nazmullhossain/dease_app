import 'package:aiataf/pages/home_pages.dart';
import 'package:aiataf/widget/bottom_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name){
    case BottomBarWidget.routeName:
      return MaterialPageRoute(builder: (context)=>BottomBarWidget());

    case HomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>HomePage());

;

    // case CategoryDealsScreen.routeName:
    //   var catagory=routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //       settings: routeSettings,
    //       builder: (_)=>CategoryDealsScreen(category: catagory,));

//noted
//     case ProductDetailsPage.routeName:
//       var product=routeSettings.arguments as Product;
//       return MaterialPageRoute(
//           settings: routeSettings,
//           builder: (_)=>ProductDetailsPage( product: product,));

    //
    // case SearchPage.routeName:
    //   var serchQuery=routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //       settings: routeSettings,
    //       builder: (_)=>SearchPage(searchQuery: serchQuery,));


    // case AddProductAdminPage.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings,
    //       builder: (_)=>AddProductAdminPage());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>Scaffold(
            body: Center(
              child: Text("Screen does not exit!"),
            ) ,
          ));
  }
}