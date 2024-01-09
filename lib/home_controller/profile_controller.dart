import 'package:austmart/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
 var profileImgPath=''.obs;

 changeImage(context) async{
   final img=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
   try{
     if(img ==null) return;
     profileImgPath.value=img.path;
   }on PlatformException catch(e){
      VxToast.show(context , msg: e.toString());
   }
 }
}


