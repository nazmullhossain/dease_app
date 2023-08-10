// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:itmedicusapp/ui/screens/product_details_pages.dart';
//
// import '../../const/const.dart';
//
// import 'car_page.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE5E5E5),
//       bottomNavigationBar: InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsPage()));
//         },
//         child: Container(
//           margin: EdgeInsets.all(10),
//           width: double.infinity,
//           height: 73,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                   offset: Offset(8, 8),
//                   blurRadius: 20,
//                   spreadRadius: 50,
//                   color: Color(0xff516E95).withOpacity(0.3))
//             ],
//             borderRadius: BorderRadius.circular(30),
//             color: Color(0xffFCFDFF),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(left: 20),
//                 height: 50,
//                 width: 51,
//                 decoration: BoxDecoration(
//                     boxShadow: [],
//                     color: Color(0xff1479FF),
//                     shape: BoxShape.circle),
//                 child: Image.asset(
//                   'images/icn.png',
//                   height: 18.28,
//                   width: 19,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 20),
//                 height: 21,
//                 width: 21,
//                 decoration: BoxDecoration(shape: BoxShape.circle),
//                 child: Image.asset(
//                   'images/user-profile.png',
//                   height: 7.77,
//                   width: 7.48,
//                   color: Color(0xff516E95),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Hi, Rakib Hasan",
//                       style: TextStyle(
//                         color: Color(0xff1D3A62),
//                         fontSize: 14,
//                       ),
//                     ),
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           height: 40.42,
//                           width: 42,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//
//                                 color: Color(0xff1479FF).withOpacity(.4),
//                                 offset: Offset(0,8),
//                                 blurRadius: 10,
//                               )
//                             ],
//                             shape: BoxShape.circle,
//                             color: Color(0xffFFFFFF).withOpacity(0.5),
//                           ),
//                         ),
//                         Container(
//                           height: 30.8,
//                           width: 32,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Color(0xffFFFFFF),
//                           ),
//                           child: Image.asset(
//                             'images/bell-icn.png',
//                             width: 15.98,
//                             height: 17.32,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 Text(
//                   "BPL \nE-ducare",
//                   style: kBarlow.copyWith(
//                     color: Color(0xFF284596),
//                     fontSize: 36,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Stack(
//                   children: [
//                     SliderScreen(),
//                     Padding(
//                       padding: EdgeInsets.only(left: 5),
//                       child: Text(
//                         "Welcome to BPL",
//                         style: kBarlow.copyWith(
//                           fontSize: 33,
//                           color: Color(0xffFFFFFF),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 144,
//                       width: 347,
//                       decoration: BoxDecoration(
//                           color: Color(0xff1479FF).withOpacity(0.4)),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 350,
//                   child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: GlobalVarriable.items.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 20,
//                           crossAxisCount: 3),
//                       itemBuilder: (context, index) {
//                         return Container(
//                           alignment: Alignment.center,
//                           width: 100,
//                           height: 95.28,
//                           decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                     offset: Offset(0, 8),
//                                     blurRadius: 20,
//                                     // spreadRadius: 5,
//
//                                     color: Color(0xff516E95).withOpacity(0.3))
//                               ],
//                               color: GlobalVarriable.items[index].color,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(GlobalVarriable.items[index].image),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 GlobalVarriable.items[index].title,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               )
//                             ],
//                           ),
//                         );
//                       }),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }