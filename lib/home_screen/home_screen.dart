import 'package:austmart/catagory_screen/item_details.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/home_screen/search_screen.dart';
import 'package:austmart/services/firestore_services.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:austmart/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/list.dart';
import '../widgets_common/home_buttons.dart';

class HomeScreen extends StatelessWidget {
<<<<<<< HEAD

=======
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();

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
                controller: controller.searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search).onTap(() {
                    if (controller.searchController.text.isNotEmptyAndNotNull) {
<<<<<<< HEAD
                      Get.to(() => SearchScreen(
                        title: controller.searchController.text,
                        ));
=======
                      Get.to(
                            () => SearchScreen(
                          title: controller.searchController.text,
                        ),
                      );
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
                    }
                  }),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchanything,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ).box.outerShadowSm.make(),
            ),
            10.heightBox,

                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                            (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todayDeal : flashsale,
                        ),
                      ),
                    ),
                    10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                            (index) => homeButton(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 3.5,
                          icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                          title: index == 0 ? topCategories : index == 1 ? brand : topSeller,
                        ),
                      ),
                    ),
<<<<<<< HEAD

                    //featured products

                    20.heightBox,

=======
                    20.heightBox,
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredproduct.text.white.fontFamily(bold).size(18).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
<<<<<<< HEAD

                            child: FutureBuilder(
                              future: FirestoreServices.getFreaturedProducts(),
                              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if(!snapshot.hasData){
                                  return Center(
                                    child: loadingIndicator(),
                                  );
                                }else if(snapshot.data!.docs.isEmpty){
                                  return "No Featured Products".text.white.makeCentered();
                                }else {

                                  var featuredData = snapshot.data!.docs;


                                  return Row(
                                    children: List.generate(
                                      featuredData.length,
                                          (index) => Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                featuredData[index]['p_imgs'][0],
                                                width: 130,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                              10.heightBox,
                                              "${featuredData[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                                              10.heightBox,
                                              "${featuredData[index]['p_price']}".numCurrency.text.color(redColor).fontFamily(bold).size(16).make(),
                                            ],
                                          ).box.white
                                              .margin(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 4))
                                              .rounded
                                              .padding(const EdgeInsets.all(8))
                                              .make().onTap(() {
                                                Get.to(()=>ItemDetails(
                                                  title: "${featuredData[index]['p_name']}",
                                                  data: featuredData[index],

                                                ));
                                          }),
                                    ),
                                  );
                                }
                              }
=======
                            child: Row(
                              children: List.generate(
                                imgfeatureproduct.length,
                                    (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgfeatureproduct[index],
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
                                    "Books".text.fontFamily(semibold).color(darkFontGrey).make(),
                                    10.heightBox,
                                    "ট600".text.color(redColor).fontFamily(bold).size(16).make(),
                                  ],
                                ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).rounded.padding(const EdgeInsets.all(8)).make(),
                              ),
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,

                    20.heightBox,
                    StreamBuilder(
                      stream: FirestoreServices.allproducts(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return loadingIndicator();
                        } else {
                          var allproductsdata=snapshot.data!.docs;
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: allproductsdata.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    allproductsdata[index]['p_imgs'][0],
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  const Spacer(),
                                  "${allproductsdata[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                                  10.heightBox,
<<<<<<< HEAD
                                  "${allproductsdata[index]['p_price']}".text.color(redColor).fontFamily(bold).size(16).make(),
=======
                                  "${allproductsdata[index]['p_name']}".text.color(redColor).fontFamily(bold).size(16).make(),
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
                                  10.heightBox,
                                ],
                              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).rounded.padding(const EdgeInsets.all(8)).make().onTap(() {
                                Get.to(()=>ItemDetails(
                                  title: "${allproductsdata[index]['p_name']}",
                                  data: allproductsdata![index],
                                ));
                              });
                            },
                          );
                        }
                      },
                    ),
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
