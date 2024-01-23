// Remove unnecessary import
// import 'dart:ffi';

import 'package:austmart/chat_screen/chat_screen.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../home_controller/product_controller.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({Key? key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.resetValues();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.share, color: darkFontGrey,),
            ),
            Obx(
              ()=> IconButton(
                onPressed: () {
                  if (controller.isFav.value) {
                    controller.removefromWishList(data.id);

                  } else {
                    controller.addtoWishList(data.id);

                  }
                },
                icon:  Icon(
                  Icons.favorite_outline,
                  color: controller.isFav.value?redColor:darkFontGrey,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                        itemCount: data['p_imgs'].length,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        height: 300,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data['p_imgs'][index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      10.heightBox,
                      title!.text.color(darkFontGrey).size(18).fontFamily(bold).make(),
                      10.heightBox,

                      10.heightBox,
                      "${data['p_price']}".numCurrency.text.fontFamily(semibold).size(18).color(Colors.red).make(),
                      20.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                "Seller".text.color(darkFontGrey).size(16).align(TextAlign.center).make(),
                                5.heightBox,
                                "abc user".text.color(darkFontGrey).fontFamily(bold).size(18).align(TextAlign.center).make(),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded, color: darkFontGrey,),
                          ).onTap(() {
                            Get.to(() => const ChatScreen(),
                              arguments: [data['p_seller'], data['vender_id']],
                            );
                          }),
                        ],
                      ).box.height(70).padding(EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),
                      20.heightBox,
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity: ".text.size(18).color(darkFontGrey).make(),
                              ),
                              Obx(()=>
                                  Row(
                                    children: [
                                      IconButton(onPressed: () {
                                        controller.decreaseQuantity();
                                        controller.calculateTotalPrice(int.parse(data['p_price']));
                                      }, icon: Icon(Icons.remove),),
                                      controller.quantity.value.text.color(darkFontGrey).fontFamily(bold).make(),
                                      IconButton(onPressed: () {controller.increaseQuantity(int.parse(data['p_quantity']));
                                        controller.calculateTotalPrice(int.parse(data['p_price']));
                                        }, icon: Icon(Icons.add)),
                                      10.widthBox,
                                      "(${data['p_quantity']} available)".text.color(darkFontGrey).fontFamily(semibold).make(),
                                    ],
                                  ),
                              ),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),

                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Total :".text.color(darkFontGrey).fontFamily(semibold).make(),
                              ),
                              "${controller.totalPrice.value}".numCurrency.text.color(Colors.red).fontFamily(bold).size(18).make(),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                        ],
                      ).box.white.shadowSm.make(),
                      10.heightBox,
                      "Description: ${data['p_desc']}".text.color(darkFontGrey).size(18).make(),
                      10.widthBox,
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextButton(
                style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20,),),
                onPressed: () {
                  controller.addToCart(
                      color: data['p_colors'][controller.colorIndex.value],
                      title: data['p_name'],
                      img:data['p_imgs'][0],
                      sellername:data['p_seller'],
                      qty: controller.quantity.value,
                      tprice: controller.totalPrice.value,
                      context: context);
                  VxToast.show(context,msg:"Added to cart");
                },
                child: const Text('Add to Cart', style: TextStyle(color: Colors.white),),
              ),
            ).backgroundColor(Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
