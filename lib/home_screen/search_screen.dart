import 'package:austmart/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../catagory_screen/item_details.dart';
=======
import 'package:velocity_x/velocity_x.dart';

>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
import '../consts/consts.dart';
import '../services/firestore_services.dart';

class SearchScreen extends StatelessWidget {
  final String? title;

  const SearchScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
      ),
      body: FutureBuilder(
        future: FirestoreServices.searchProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No Products found".text.makeCentered();
<<<<<<< HEAD
          } else  {
            var data = snapshot.data!.docs;
            var filtered = data.where( (element) => element['p_name'].toString().toLowerCase().contains(title!.toLowerCase())).toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8,  mainAxisExtent: 300),


                children: filtered.
                mapIndexed((currentValue, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      filtered[index]['p_imgs'][0],
=======
          } else {
            var data = snapshot.data!.docs;
            print(data[0]['p_name']);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 300,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                var productData = data[index].data() as Map<String, dynamic>;
                return Column(
                  children: [
                    Image.network(
                      productData['image_url'],
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    const Spacer(),
<<<<<<< HEAD
                    "${filtered[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                    10.heightBox,
                    "${filtered[index]['p_price']}".text.color(redColor).fontFamily(bold).size(16).make(),
                    10.heightBox,
                  ],
                ).box.white.outerShadowMd.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(12)).make()
                    .onTap(() {
                  Get.to(()=>ItemDetails(
                    title: "${filtered[index]['p_name']}",
                    data: filtered[index],

                  ));
                })
                ).toList(),
              ),
            );

          }

=======
                    productData['p_name'].text.fontFamily(semibold).color(darkFontGrey).make(),
                    10.heightBox,
                    productData['price'].toString().text.color(redColor).fontFamily(bold).size(16).make(),
                    10.heightBox,
                  ],
                ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).rounded.padding(const EdgeInsets.all(8)).make();
              },
            );
          }
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
        },
      ),
    );
  }
}
