import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:austmart/consts/consts.dart';
Widget CustomButton({onPress,color,textcolor,String?title}) {
  return ElevatedButton(
    style:ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed:  onPress,
    
    child: title!.text.color(textcolor).fontFamily(bold).make(),
  );
}