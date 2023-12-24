import 'package:austmart/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget
{
  final String? title;
  const ItemDetails({Key?key, this.title}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {} , icon: const Icon(Icons.share)),
          IconButton(onPressed: () {} , icon: const Icon(Icons.favorite_outline)),
        ],

      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.red,)),
          SizedBox(
            width: double.infinity,
            height: 60,

          )
        ],
      )
    );
  }

}