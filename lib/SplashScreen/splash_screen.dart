import 'package:austmart/auth_screen/login_screen.dart';
import "package:austmart/consts/consts.dart";
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),()
    {
      Get.to(()=>LoginScreen());
    });
  }
  void initState()
  {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.lightGreen ,
      body: Center(
        child:Column(
          children:[
            Align(alignment:Alignment.topLeft,child: Image.asset(icSplashBg,width:300)),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        )
      ),
    );


    }
  }

