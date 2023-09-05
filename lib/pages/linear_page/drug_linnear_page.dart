import 'package:aiataf/provider/brand_provider.dart';
import 'package:aiataf/provider/company_provider.dart';
import 'package:aiataf/services/brands_services.dart';
import 'package:aiataf/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/brands_models.dart';
import '../../provider/generic_provider.dart';
import '../company_pages.dart';
import 'linear_widget/drug/drug_widget.dart';
import 'linear_widget/generic_widget.dart';

class DragLinearPage extends StatefulWidget {
  const DragLinearPage({super.key});

  @override
  State<DragLinearPage> createState() => _DragLinearPageState();
}

class _DragLinearPageState extends State<DragLinearPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Data>? data;
  int currentPage = 10;
  int itemsPerPage = 10;

  // bool isLoading = false;
  //
  // BrandServices brandServices=BrandServices();
  //
  // getBrand()async{
  //   data=await brandServices.geBrand(context);
  //   setState(() {
  //     currentPage++;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    // getBrand();
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
      backgroundColor: Color(0xffEBE5D9),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xffEBE5D9),
        title: Text("Drugs",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          Consumer<RecipeClass>(
              builder: (BuildContext context, provider, Widget? child) {
            return IconButton(
                onPressed: () {
                  // provider.joinGetData();
                  provider.getRecipes();
                },
                icon: Icon(Icons.add));
          }),
          Consumer<CompanyProvider>(
              builder: (BuildContext context, provider, Widget? child) {
            return IconButton(
                onPressed: () {
                  provider.getRecipes();
                },
                icon: Icon(Icons.comment));
          }),
          Consumer<GenericProvider>(
              builder: (BuildContext context, provider, Widget? child) {
            return IconButton(
                onPressed: () {
                  provider.getGenric();
                },
                icon: Icon(Icons.comment));
          })
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20,right: 10,left: 10),
         decoration: BoxDecoration(
             border: Border.all(color: Colors.blueAccent),
           color: Color(0xffEBE5D9)
               ,borderRadius: BorderRadius.circular(5)
         ),
                child: TabBar(
                    controller: _tabController,
                    labelColor: Color(0xFFE57734),
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    isScrollable: true,
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xFFE57734)),
                        insets: EdgeInsets.symmetric(horizontal: 16)),
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                      Tab(
                        text: "Brand",
                      ),
                      Tab(
                        text: "Generic",
                      ),
                      Tab(
                        text: "Therapeutic",
                      ),
                      Tab(
                        text: "Americano",
                      ),
                    ]),
              ),
             SearchWidget(hintText: "Search by brand name"),
              SizedBox(
                height: 10,
              ),
              Center(
                child: [
                  DrugItemWidget(),
                  CompanyItemWidget(),
                  GenericWidget(),
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
