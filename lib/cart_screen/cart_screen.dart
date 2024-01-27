import 'package:austmart/cart_screen/shipping_scree.dart';
import 'package:austmart/home_controller/cart_controller.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/services/firestore_services.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../widgets_common/loading_indicator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar:  CustomButton(
        color: redColor,
        onPress: (){
          Get.to(()=>const ShippingDetails());
        },
        textcolor: whiteColor,
        title: "Procced to shipping"

      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping cart".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "Your cart is empty.".text.color(darkFontGrey).make(),
            );
          } else {
            var data=snapshot.data!.docs;
            controller.calculate(data);
            controller.productSnapshot=data;
            // Your code to display the cart items
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index){
                              return ListTile(
                                leading: Image.network("${data[index]['img']}"),
                                title: "${data[index]['title']}(x${data[index]['qty']})"
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                                subtitle:"${data[index]['tprice']}"
                                    .text
                                    .fontFamily(semibold)
                                    .size(16)
                                    .make(),
                                trailing: const Icon(
                                  Icons.delete,
                                  color:redColor,
                                ).onTap(() {
                                  FirestoreServices.deleteDocument(data[index].id);

                                }),

                              );
                            },

                          ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Total price".text.fontFamily(semibold).color(darkFontGrey).make(),
                      Obx(
                          ()=>"${controller.totalIP.value}"
                          .numCurrency
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make()),
                    ],
                  ).box.padding(EdgeInsets.all(12)).color(Colors.yellow).width(context.screenWidth - 60).roundedSM.make(),
                  10.heightBox,
                  /*SizedBox(
                    width: context.screenWidth - 60,
                    child: CustomButton(
                      color: redColor,
                      onPress: () {},
                      textcolor: whiteColor,
                      title: "Proceed to shipping",
                    ),
                  ),*/
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
