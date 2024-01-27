import 'package:austmart/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Widget detailsCard({width,String? count,String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(Colors.black).size(16).make(),
      5.heightBox,
      title!.text.color(Colors.black).make(),
    ],
  ).box.rounded.white.width(width).height(80).padding(EdgeInsets.all(4)).make();

}