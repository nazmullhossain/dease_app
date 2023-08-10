
import 'package:aiataf/const/global_const.dart';
import 'package:flutter/material.dart';

import '../widget/single_image_widget.dart';
class ImageListPage extends StatelessWidget {
  const ImageListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Image List"),
      ),



      body: SingleChildScrollView(
        child: Column(
          children: [




            GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {

                return Column(
                  children: [
                    SizedBox(height: 15,),
                    SizedBox(
                      height: 150,
                      child: SingleProduct(
                        image: GlobalVarriable.,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),

                              Text(
                                productData.price.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: ()=>deleteProduct(productData, index),
                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
