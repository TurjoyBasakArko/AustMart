import 'package:austmart/consts/list.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpScreenState();
}
  class _SignUpScreenState extends State<SignUp>{
     bool?isCheck=false;
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
              const SizedBox(height: 10),
              ("Join the $appname".text
                  .fontFamily(bold)
                  .white
                  .size(18))
                  .make(),
              SizedBox(height: 15),
              Column(
                children: [
                  customTextField(name, nameHint),
                  customTextField(email, emailHint),
                  customTextField(password, passwordHint),
                  customTextField(retypePassword, passwordHint),
                  Align(
                    alignment: Alignment.centerRight,
                    child:


                    Row(
                      children: [
                        Checkbox(
                          activeColor:redColor ,
                          checkColor: whiteColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck=newValue;
                            });
                          },
                        ),
                        10.widthBox,
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: termAndCond,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "&",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                                TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  CustomButton(
                    onPress: () {},
                    color: isCheck==true?redColor:lightGrey,
                    textcolor: whiteColor,
                    title: signUp,
                  ).box.width(context.screenWidth - 50).make(),
                  SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                          text: logIn,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  }),
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
