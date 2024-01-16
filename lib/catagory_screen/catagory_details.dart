import 'package:austmart/catagory_screen/item_details.dart';
import 'package:austmart/consts/list.dart';
import 'package:austmart/catagory_screen/catagory_details.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/home_controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class CatagoryDetails extends StatelessWidget {
  final String? title;
  const CatagoryDetails({Key?key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title:'$title'.text.white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                  child:Row(
                    children: List.generate(
                      controller.subcat.length,
                         (index) => "${controller.subcat[index]}".text.size(16).fontFamily(semibold).makeCentered().box.size(150, 60).margin(EdgeInsets.symmetric(horizontal: 4)).white.make()),
                  ),
              ),
              10.heightBox,
              Expanded(child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                 shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250),
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(imgFc1,height: 150,width: 200,fit: BoxFit.cover,),

                        "Books".text.fontFamily(semibold).color(darkFontGrey).make(),
                        10.heightBox,
                        "400/-".text.color(Colors.red).fontFamily(bold).make(),
                      ],
                    ).box.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(12)).outerShadowSm.make().onTap(() {
                      Get.to(()=>ItemDetails(title: 'Dummy Title',));
                    });

                  }))
              
              
              
            ],
          ),
        ),
      )
    );
  }
}
