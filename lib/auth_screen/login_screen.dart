import 'package:austmart/auth_screen/SignUp.dart';
import 'package:austmart/consts/list.dart';
import 'package:austmart/home_screen/home.dart';
import 'package:austmart/home_screen/home_screen.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Column(
                children: [
                  customTextField(email, emailHint),
                  customTextField(password, passwordHint),
                  Align(
                    alignment: Alignment.centerRight,

                        child:
                            TextButton(
                              onPressed: () {},
                              child: forgetPass.text.make(),
                            )),
                            5.heightBox,
                            CustomButton(
                              onPress: () {
                                Get.to(()=>const Home());
                              },
                              color: redColor,
                              textcolor: whiteColor,
                              title: logIn,
                            ).box.width(context.screenWidth - 50).make(),


                        SizedBox(height: 5),
                        CreateNewAccount.text.color(fontGrey).make(),
                        SizedBox(height: 5),
                        CustomButton(
                          onPress: () {
                            Get.to(() => const SignUp());
                          },
                          color: golden,
                          textcolor: redColor,
                          title: signUp,
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
            ],
          ),
        ),
      ),
    );
  }
}
