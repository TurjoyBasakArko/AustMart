import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:flutter/services.dart';

Widget exitDialoge(context){
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).color(Colors.black).size(20).make(),
        10.heightBox,
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit?".text.fontFamily(bold).color(darkFontGrey).size(18).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            CustomButton(onPress: (){ SystemNavigator.pop();},color: redColor,textcolor: whiteColor,title: "Yes"),
            CustomButton(onPress: (){Navigator.pop(context);},color: redColor,textcolor: whiteColor,title: "No"),
          ],
        )
      ],
    ).box.padding(const EdgeInsets.all(12)).color(lightGrey).rounded.make(),
  );
}
