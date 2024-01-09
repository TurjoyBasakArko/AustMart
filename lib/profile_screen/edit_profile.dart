import 'dart:io';

import 'package:austmart/consts/consts.dart';
import 'package:austmart/home_controller/profile_controller.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =Get.find<ProfileController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            controller.profileImgPath.isEmpty ? Image.asset(imgProfile2,width: 110,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make():Image.file(
                File(controller.profileImgPath.value ),
              width:100,
              fit: BoxFit.cover ,
            ).box.roundedFull.clip(Clip.antiAlias).make(),


            10.heightBox,
            CustomButton(onPress: () {
              controller.changeImage(context);
            } ,color: redColor,textcolor: whiteColor,title: "Change",),
            Divider(),
            20.heightBox,
            customTextField(
              hint: nameHint,title: name,isPass: false),
            customTextField(hint: passwordHint,title: password,isPass: true),
            20.heightBox,
            SizedBox(
                width: 150,
                child: CustomButton(color: redColor,onPress: () {},textcolor: whiteColor,title: "Save")),
          ],
        ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50,right: 12,left: 12)).rounded.make(),
      )
    );
  }
}
