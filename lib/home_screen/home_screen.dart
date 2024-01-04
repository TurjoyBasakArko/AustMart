import 'package:austmart/consts/list.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart'; // Import VelocityX for VxSwiper

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border:InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchanything, // Fixed typo
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),
            10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
               child: Column(
                     children: [   VxSwiper.builder(
                       aspectRatio: 16 / 9,
                       autoPlay: true,
                       height: 150,
                       enlargeCenterPage: true,
                       itemCount: sliderList.length,
                       itemBuilder: (context, index) {
                         return Image.asset(
                           sliderList[index],
                           fit: BoxFit.fill,
                         ).box
                             .rounded
                             .clip(Clip.antiAlias)
                             .margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                       },
                     ),
                       10.heightBox,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children:List.generate(2, (index) => homeButton(
                           height:context.screenHeight*0.15,
                           width:context.screenWidth/2.5,
                           icon:index==0?icTodaysDeal:icFlashDeal,
                           title:index==0?todayDeal:flashsale,
               
                         )),
                       ),
                       10.heightBox,
                       VxSwiper.builder(
                         aspectRatio: 16 / 9,
                         autoPlay: true,
                         height: 150,
                         enlargeCenterPage: true,
                         itemCount: secondsliderList.length,
                         itemBuilder: (context, index) {
                           return Image.asset(
                             secondsliderList[index],
                             fit: BoxFit.fill,
                           ).box
                               .rounded
                               .clip(Clip.antiAlias)
                               .margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                         },
                       ),
                       10.heightBox,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children:List.generate(3, (index) => homeButton(
                           height:context.screenHeight*0.15,
                           width:context.screenWidth/3.5,
                           icon:index==0
                               ? icTopCategories
                               : index==1
                               ?icBrands
                               :icTopSeller,
               
                           title:index==0
                               ?topCategories
                               :index==1
                               ?brand
                               :topSeller,
               
                         )),
                       ),
                       20.heightBox,
                       Align(alignment: Alignment.centerLeft,child: catagories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()), 
                           
                         20.heightBox,
                         SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:Row(
                            children: List.generate(3,(index)=> Column(
                            children: [
                              featuredButton(icon: featuredImages1[index],title:featuredTitles1[index] ),
                              10.heightBox,
                              featuredButton(icon: featuredImages2[index],title:featuredTitles2[index] ),
                            ],
                          ),
                        ),//column
                         )

                       )
                     ],
               ),
             ),
          ),
          ],
        ),
      ),
    );
  }
}