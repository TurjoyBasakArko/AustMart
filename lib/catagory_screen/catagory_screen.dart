import 'package:austmart/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';


class CatagoryScreen extends StatelessWidget
{
  const CatagoryScreen({Key?key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: catagories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200),
              itemBuilder: (context,index) {
                return Column(
                  children: [
                    
                  ],
                ).box.white.clip(Clip.antiAlias).outerShadowSm.make();
              }),
        ),
      )
    );
  }

}