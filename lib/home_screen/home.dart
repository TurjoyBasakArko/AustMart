import 'package:austmart/cart_screen/cart_screen.dart';
import 'package:austmart/catagory_screen/catagory_screen.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/home_screen/home_screen.dart';
import 'package:austmart/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget{
  const Home({Key?key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    var controller=Get.put(HomeController());
    var navbarItem=[
      BottomNavigationBarItem(icon:Image.asset(icHome,width:26),label:home),
      BottomNavigationBarItem(icon:Image.asset(icCategories,width:26),label:catagories),
      BottomNavigationBarItem(icon:Image.asset(icCart,width:26),label:cart),
      BottomNavigationBarItem(icon:Image.asset(icProfile,width:26),label:account)

    ];
    var navBody=
    {
      HomeScreen(),
      CatagoryScreen(),
      CartScreen(),
      ProfileScreen(),

    };
    return Scaffold(
      body: Column(
        children: [
          Obx(
                  ()=> Expanded(child:navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
            ()=>
            BottomNavigationBar(
              items: navbarItem,
              currentIndex: controller.currentNavIndex.value,
              selectedItemColor: redColor,
              selectedLabelStyle:const TextStyle(fontFamily:semibold) ,
              type:BottomNavigationBarType.fixed,
              backgroundColor:whiteColor,
              onTap:(value){
                controller.currentNavIndex.value=value;
              }
              ,
            ),
      ),
    );

  }
}