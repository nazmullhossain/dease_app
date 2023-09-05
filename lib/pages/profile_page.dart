import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Personal Information",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_document,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    // SizedBox(height: 1,),
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                     const SizedBox(height: 5,),
                     const Text("Name",style: TextStyle(fontSize: 10,color: Colors.white),),
                     const Text("Md Nazmu Hossain",style: TextStyle(fontSize: 14,color: Colors.white),),
                    const Text("Phone",style: TextStyle(fontSize: 10,color: Colors.white),),
                    SizedBox(height: 10,),

                    const Text("Email",style: TextStyle(fontSize: 10,color: Colors.white),),
                    const Text("nazmul@gmail.com",style: TextStyle(fontSize: 14,color: Colors.white),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
