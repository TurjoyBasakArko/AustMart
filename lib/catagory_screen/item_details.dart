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
      backgroundColor:lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {} , icon: const Icon(Icons.share,color: darkFontGrey,)),
          IconButton(onPressed: () {} , icon: const Icon(Icons.favorite_outline,color: darkFontGrey,)),
        ],

      ),
      body: Column(

        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(itemCount: 3,
                      autoPlay: true,
                      aspectRatio: 16/9,
                      height: 300,
                      itemBuilder:(context,index){
                    return Image.asset(imgFc1,width: double.infinity,fit: BoxFit.cover,);
                  }),
                  10.heightBox,
                  title!.text.color(darkFontGrey).size(18).fontFamily(bold).make(),
                  10.heightBox,
                  VxRating(onRatingUpdate: (value){},normalColor: textfieldGrey,selectionColor: golden,count: 5,size: 25,stepInt: true,),
                  10.heightBox,
                  "400/-".text.fontFamily(semibold).size(18).color(Colors.red).make(),

                  20.heightBox,
                  Row(
                    children: [
                      Expanded(child:
                      Column(
                        children: [
                          "Seller".text.color(darkFontGrey).size(16).align(TextAlign.center).make(),
                          5.heightBox,
                          "abc user".text.color(darkFontGrey).fontFamily(bold).size(18).align(TextAlign.center).make(),
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded,color: darkFontGrey,),
                      )
                    ],
                  ).box.height(70).padding(EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),
               20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.size(18).color(darkFontGrey).make(),
                          ),
                          Row(
                            children:[
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove),),
                              "0".text.color(darkFontGrey).fontFamily(bold).make(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                              "(0 available)".text.color(darkFontGrey).fontFamily(semibold).make(),
                            ],
                          ),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Total :".text.color(darkFontGrey).fontFamily(semibold).make(),
                              ),
                              "0/-".text.color(Colors.red).fontFamily(bold).size(18).make(),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),
                  10.heightBox,
                  "Description: ".text.color(darkFontGrey).size(18).make(),
                ],
              ),
            )
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20,),
              ),
              onPressed: (){} ,
              child: const Text('Add to Cart',style:TextStyle(color: Colors.white),),
            ),
          ).backgroundColor(Colors.redAccent),
        ],
      )
    );
  }

}