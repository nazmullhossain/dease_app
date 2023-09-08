import 'package:aiataf/pages/profile_page.dart';
import 'package:aiataf/pages/splash_pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favorite_page.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: [
            Text(
              "SkinVD",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "1.0.3",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.8)),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoritePage()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Favorite",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.8)),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "About us",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.8)),
                  )
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Facebook",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.8)),
                  )
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.8)),
                  )
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              Row(
                children: [
                  Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: ()async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                   await   prefs.remove("token");

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));


                    },
                    child: Text(
                      "Log out",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
