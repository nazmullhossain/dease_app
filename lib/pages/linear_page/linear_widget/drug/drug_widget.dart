import 'package:flutter/material.dart';

class DrugItemWidget extends StatelessWidget {
  const DrugItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 800,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 20,
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
    );
  }
}
