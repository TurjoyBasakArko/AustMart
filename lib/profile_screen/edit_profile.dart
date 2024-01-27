import 'dart:io';
//import 'dart:html';
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

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(

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
                      : Image.file(File(controller.profileImgPath.value ),
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
              10.heightBox,
              customTextField(
                  controller: controller.oldpassController,
                  hint: passwordHint,
                  title: oldpass,
                  isPass: true
              ),
              10.heightBox,
              customTextField(
                  controller: controller.newpassController,
                  hint: passwordHint,
                  title: newpass,
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


                    //if image is not selected

                    if(controller.profileImgPath.value.isNotEmpty){
                      await controller.uploadProfileImage();
                    }else{
                      controller.profileImageLink= data['imageUrl'];
                    }

                    //if old password match database here
                    if (data ['password']== controller.oldpassController.text){

                      await controller.changeAuthPassword(
                        email : data ['email'],
                        password : controller.oldpassController.text,
                        newpassword: controller.newpassController.text);




                      await controller.updateProfile(

                          imgUrl: controller.profileImageLink,

                          name: controller.nameController.text,
                          password: controller.newpassController.text);
                      VxToast.show(context, msg: "Updated");

                    }else {
                      VxToast.show(context, msg: "Wrong old password");
                      controller.isloading(false);
                    }



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


        ),
      )
    );
  }
}
