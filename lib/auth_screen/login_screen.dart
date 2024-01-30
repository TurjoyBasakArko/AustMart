import 'package:austmart/auth_screen/SignUp.dart';

import 'package:austmart/consts/list.dart';
import 'package:austmart/home_controller/auth_controller.dart';
import 'package:austmart/home_screen/home.dart';
import 'package:austmart/home_screen/home_screen.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:austmart/auth_screen/SignUp.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: context.screenHeight * 0.1),
              applogoWidget(),
              SizedBox(height: 10),
              ("$appname Login".text
                  .fontFamily(bold)
                  .white
                  .size(18))
                  .make(),
              SizedBox(height: 15),
              Obx(
                    ()=>Column(
                  children: [
                    customTextField(hint: emailHint, title: email, isPass: false, controller: controller.emailController),
                    customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                    Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: forgetPass.text.make(),)),
                    5.heightBox,

                    controller.isloading.value ?
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.red),
                    ): CustomButton(
                      color: redColor,
                      title: logIn,
                      textcolor: whiteColor,
                      onPress: () async{
                        controller.isloading(true);
                        await controller.loginMethod(context: context).then((value) {
                          if(value!=null){
                            VxToast.show(context, msg: loggedin);
                            Get.offAll( ()=> const Home() );
                          }else(
                          controller.isloading(false)
                          );
                        });
                      },
                    ).box.width(context.screenWidth - 50).make(),
                    SizedBox(height: 5),
                    CreateNewAccount.text.color(fontGrey).make(),
                    SizedBox(height: 5),
                    CustomButton(
                        color: golden,
                        title: signUp,
                        textcolor: redColor,
                        onPress: () {
                          Get.to(() => const SignUp());
                        }
                    ).box.width(context.screenWidth - 50).make(),
                    SizedBox(height: 10),
                    loginWith.text.color(fontGrey).make(),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                            (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 25,
                            child: Image.asset(
                              socialIconList[index],
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                
                
                
                  ],
                ).box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
