<<<<<<< HEAD
import 'package:austmart/catagory_screen/catagory_details.dart';
import 'package:austmart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
=======
import 'package:austmart/consts/consts.dart';
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337



Widget featuredButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(icon, width: 40, fit: BoxFit.fill),
      10.widthBox,
      books.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
<<<<<<< HEAD
  ).box.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).white.padding(const EdgeInsets.all(4)).roundedSM.outerShadowSm
      .make()
      .onTap(() {
        Get.to( () => CatagoryDetails(title: title));
  });
=======
  ).box.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).white.padding(const EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337


}