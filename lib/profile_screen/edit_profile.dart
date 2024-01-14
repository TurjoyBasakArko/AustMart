import 'dart:io';

import 'package:austmart/consts/consts.dart';
import 'package:austmart/home_controller/profile_controller.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/button.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    var controller =Get.find<ProfileController>();
<<<<<<< HEAD


=======
    controller.nameController.text= data['name'];
    controller.passController.text= data['password'];
>>>>>>> 565700a6086f8ca158a1de1d5f4de09ac17c2084
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
<<<<<<< HEAD
           ()=>Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              //if data image url and controller path is empty
              data['imageUrl']=='' && controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile2,width: 70,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()

                  //if data is not empty but controller path is empty
                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty


                      ? Image.network(
                          data['imageurl'],
                          width:100,
                          fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()

                      //if both are empty
                      : Image.file(
                          File(controller.profileImgPath.value ),
                          width:100,
                          fit: BoxFit.cover ,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),


              10.heightBox,
              CustomButton(
                color: redColor,
                onPress: () {
                controller.changeImage(context);
                },
                textcolor: whiteColor,
                title: "Change"),
              Divider(),
              20.heightBox,
              customTextField(
                  controller: controller.nameController,
                  hint: nameHint,
                  title: name,
                  isPass: false
              ),
              customTextField(
                  controller: controller.passController,
                  hint: passwordHint,
                  title: password,
                  isPass: true
              ),
              20.heightBox,
              controller.isloading.value
               ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              )
              : SizedBox(
                  width: context.screenWidth - 100,
                  child: CustomButton(color: redColor,onPress: () async {
                    controller.isloading(true);

                    await controller.uploadProfileImage();
                    await controller.updateProfile(
                      //imgUrl: controller.profileImageLink,
                      name: controller.nameController.text,
                      password: controller.passController.text);
                    VxToast.show(context, msg: "Updated");

                  },
                      textcolor: whiteColor,
                      title: "Save")),
            ],
          )
               .box
               .white
               .shadowSm
               .padding(EdgeInsets.all(16))
               .margin(EdgeInsets.only(top: 50,left: 12,right: 12))
               .rounded
               .make(),
=======
              ()=>Column(
            mainAxisSize: MainAxisSize.min,
            children: [


              controller.profileImgPath.isEmpty ? Image.asset(imgProfile2,width: 70,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make():Image.file(
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
                controller: controller.nameController,
                  hint: nameHint,title: name,isPass: false),
              customTextField(
                controller: controller.passController,
                  hint: passwordHint,title: password,isPass: true),
              20.heightBox,
              SizedBox(
                  width: 100,
                  child: CustomButton(color: redColor,onPress: () {},textcolor: whiteColor,title: "Save")),
            ],
          ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50,right: 12,left: 12)).rounded.make(),
>>>>>>> 565700a6086f8ca158a1de1d5f4de09ac17c2084
        ),
      )
    );
  }
}
