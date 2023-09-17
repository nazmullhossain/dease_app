import 'package:flutter/material.dart';

class DoctorDetailsPage extends StatelessWidget {
  DoctorDetailsPage(
      {super.key,
      required this.title,
      required this.name,
      required this.img,
      required this.qualification});
  String title, name, qualification, img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBE5D9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffEBE5D9),
        title: const Text("Doctor Profile"),
        centerTitle: true,
        actions: const [Icon(Icons.share)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      "images/consultant.png",
                      width: 50,
                      height: 50,
                    )),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 50),
                        child: Text(
                          "${title} ${name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue),
                        )),
                    Text(qualification)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Consultant"),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Others Doctor"),
                )
              ],
            ),
            Text("SQure Hospital"),
            Divider(),
            Divider(),
            Text("Gender"),
            SizedBox(
              height: 5,
            ),
            Text(
              "Female",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Chamber:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text(
                "SQURE Hospital",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "18/F Bir uttam Qazi Nuruzaman sarak west \n Panthopath,Dhaka"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("015454564"),
                Divider(),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fee"),
                  Text("0"),
                  Text("Report Fee"),
                  Text("0"),
                  Text("Re Visit Fee"),
                  Text("0")
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Day",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Text(
                    "Time",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
