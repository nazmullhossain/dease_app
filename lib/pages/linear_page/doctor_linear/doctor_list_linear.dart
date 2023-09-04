import 'package:flutter/material.dart';

class DoctorListLinear extends StatelessWidget {
  const DoctorListLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Doctor's List"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(225, 50, 54, 56),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    border: InputBorder.none,
                    hintText: "Search by doctor name",
                    hintStyle:
                    TextStyle(color: Colors.white.withOpacity(0.5))),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
