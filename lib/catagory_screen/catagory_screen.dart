import 'package:austmart/catagory_screen/catagory_details.dart';
import 'package:austmart/consts/list.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/home_controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';


class CatagoryScreen extends StatelessWidget
{
  const CatagoryScreen({Key?key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: catagories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 250),
              itemBuilder: (context,index) {
                return Column(
                  children: [
                   Image.asset(catagoryImages[index],height: 200,width:200,fit: BoxFit.cover,),
                    10.heightBox,
                    catagoryList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
                  ],
                ).box.white.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                  controller.getSubCategories(catagoryList[index]);


                  Get.to(()=>CatagoryDetails(title: catagoryList[index]));
                });
              }),
        ),
      )
    );
  }

}