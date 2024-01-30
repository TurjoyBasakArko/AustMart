import 'package:austmart/catagory_screen/item_details.dart';
import 'package:austmart/consts/list.dart';
import 'package:austmart/catagory_screen/catagory_details.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/home_controller/product_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../services/firestore_services.dart';
import '../widgets_common/loading_indicator.dart';

class CatagoryDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const CatagoryDetails({Key? key, required this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getProducts(title!),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "No products found!".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;

<<<<<<< HEAD
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.subcat.length,
                            (index) => "${controller.subcat[index]}"
                            .text
                            .size(16)
                            .fontFamily(semibold)
                            .makeCentered()
                            .box
                            .size(150, 60)
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .white
                            .make(),
                      ),
                    ),
                  ),
                  10.heightBox,
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data[index]['p_imgs'][0],
                                height: 180,
                                width: 250,
                                fit: BoxFit.cover,
                              )
                                  .box
                                  .roundedSM
                                  .clip(Clip.antiAlias)
                                  .make(),

                              5.heightBox,
                              "${data[index]['p_name']}"
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .color(darkFontGrey)
                                  .make(),
                              5.heightBox,
                              "${data[index]['p_price']}"
                                  .text
                                  .color(Colors.red)
                                  .size(18)
                                  .fontFamily(bold)
                                  .make(),
                            ],
                          )
                              .box
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .padding(EdgeInsets.all(8))
                              .outerShadowSm
                              .make()
                              .onTap(() {
                            controller.checkIfFav(data[index]);

                            Get.to(() => ItemDetails(
                              title: "${data[index]['p_name']}",
                              data: data![index],
                            ));
                          }),
                        );
                      },
                    ),
                  ),
                ],
=======
              return Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.subcat.length,
                              (index) => "${controller.subcat[index]}"
                              .text
                              .size(16)
                              .fontFamily(semibold)
                              .makeCentered()
                              .box
                              .size(150, 60)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .white
                              .make(),
                        ),
                      ),
                    ),
                    10.heightBox,
                    Expanded(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                        ),
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index]['p_imgs'][0],
                                  height: 180,
                                  width: 250,
                                  fit: BoxFit.cover,
                                )
                                    .box
                                    .roundedSM
                                    .clip(Clip.antiAlias)
                                    .make(),

                                5.heightBox,
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .size(16)
                                    .color(darkFontGrey)
                                    .make(),
                                5.heightBox,
                                "${data[index]['p_price']}"
                                    .text
                                    .color(Colors.red)
                                    .size(18)
                                    .fontFamily(bold)
                                    .make(),
                              ],
                            )
                                .box
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .padding(EdgeInsets.all(8))
                                .outerShadowSm
                                .make()
                                .onTap(() {
                              controller.checkIfFav(data[index]);

                              Get.to(() => ItemDetails(
                                title: "${data[index]['p_name']}",
                                data: data![index],
                              ));
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
              );
            }
          },
        ),
      ),
    );
  }
}
