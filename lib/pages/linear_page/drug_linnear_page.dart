import 'package:flutter/material.dart';

import 'linear_widget/drug/drug_widget.dart';

class DragLinearPage extends StatefulWidget {
  const DragLinearPage({super.key});

  @override
  State<DragLinearPage> createState() => _DragLinearPageState();
}

class _DragLinearPageState extends State<DragLinearPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }



  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("Drugs"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: SizedBox(
  height: 800,
          child: ListView(
            children: [

              TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFFE57734),
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 3,
                          color: Color(0xFFE57734)
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 16)
                  ),
                  labelStyle: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w500),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text: "Brand",),
                    Tab(text: "Generic",),
                    Tab(text: "Therapeutic",),
                    Tab(text: "Americano",),

                  ]),

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
                      prefixIcon: Icon(Icons.search,size: 30,
                        color: Colors.white.withOpacity(0.5),),
                      border: InputBorder.none,
                      hintText: "Search by brand name",
                      hintStyle:
                      TextStyle(color: Colors.white.withOpacity(0.5))),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: [

                  DrugItemWidget(),
                  DrugItemWidget(),
                  DrugItemWidget(),
                  DrugItemWidget(),

                ][_tabController.index],
              )
            ],
          ),
        ),
      ),
    );
  }
}
