import 'dart:ui';

import 'package:austmart/consts/consts.dart';
import 'package:austmart/consts/list.dart';
import 'package:austmart/home_controller/cart_controller.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:austmart/widgets_common/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';

class PayMentmethods extends StatelessWidget {
  const PayMentmethods({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<CartController>();
    return Obx(
      ()=> Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: SizedBox(
          height: 60,
          child:controller.placingOrder.value?Center(
            child: loadingIndicator(),
          ) :CustomButton(
            onPress: () async {
            await  controller.placeMyOrder(
                  orderPaymentMethod:paymentMethods[controller.paymentIndex.value],
                  totalAmount: controller.totalIP.value);
            await controller.clearCart();
            VxToast.show(context, msg: "Order placed successfully");
            Get.offAll(const Home());

            },
            color: redColor,
            textcolor: whiteColor,
            title: "Place my order",
          ),
        ),
        appBar: AppBar(
          title: "Choose Payment Method".text.fontFamily(semibold).color(darkFontGrey).make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(
              ()=>Column(
              children: List.generate(paymentMethodsImg.length, (index) {
                bool isChecked = true; // Set the initial state as needed
      
                return GestureDetector(
                  onTap: (){
                    controller.changePaymentIndex(index);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
      
                        color: controller.paymentIndex.value==index? redColor:Colors.transparent,
                        width: 4,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                            paymentMethodsImg[index],
                            width: double.infinity,
                            height: 120,
                            colorBlendMode: controller.paymentIndex.value==index?BlendMode.darken:BlendMode.color,
                            color: controller.paymentIndex.value==index?Colors.black.withOpacity(0.4):Colors.transparent,
                            fit: BoxFit.cover
                        ),
                        controller.paymentIndex.value==index
                        ?Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            activeColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            value: isChecked,
                            onChanged: (value) {
                              // Update the state based on user interaction
                              isChecked = value!;
                            },
                          ),
                        )
                            :Container(),
                        Positioned(
                          bottom: 10,
                            right:10,
      
                            child: paymentMethods[index].text.white.fontFamily(bold).size(16).make(),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
