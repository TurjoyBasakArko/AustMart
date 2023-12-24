import 'package:austmart/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget
{
  const CartScreen({Key?key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.blue,
      child: "Cart is Empty!".text.size(30).fontFamily(semibold).color(Colors.black).makeCentered(),
    );
  }

}