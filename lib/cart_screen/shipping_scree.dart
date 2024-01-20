import 'package:austmart/catagory_screen/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../consts/consts.dart';
import '../home_controller/cart_controller.dart';
import '../widgets_common/button.dart';
import '../widgets_common/custom_textfield.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<CartController>();
    return Scaffold(

      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: CustomButton(
          color: redColor,
          onPress: () {
            if(controller.addressController.text.length>10)
            {
              Get.to(()=>const PayMentmethods());
            }else {
                VxToast.show(context, msg: "Please fill the form");
              }
          },
          textcolor: whiteColor,
          title: "Continue",
        ),
      ),
      body: Column(
        children: [
          customTextField(hint: "Address",isPass: false,title: "Address",controller: controller.addressController),
          customTextField(hint: "City",isPass: false,title:"City",controller: controller.addressController),
          customTextField(hint: "State",isPass: false,title: "State",controller: controller.addressController),
          customTextField(hint: "PostalCode",isPass: false,title: "PostalCode",controller: controller.addressController),
          customTextField(hint: "Phone",isPass: false,title: "Phone",controller: controller.addressController),

        ],
      ),
    );
  }
}
