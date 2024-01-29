import 'package:austmart/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    const Spacer(),
                    productData['p_name'].text.fontFamily(semibold).color(darkFontGrey).make(),
                    10.heightBox,
                    productData['price'].toString().text.color(redColor).fontFamily(bold).size(16).make(),
                    10.heightBox,
                  ],
                ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).rounded.padding(const EdgeInsets.all(8)).make();
              },
            );
          }
        },
      ),
    );
  }
}
