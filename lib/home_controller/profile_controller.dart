<<<<<<< HEAD

import 'dart:html';

import 'package:austmart/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:path/path.dart';
 import 'package:firebase_storage/firebase_storage.dart';


class ProfileController extends GetxController{
 var profileImgPath=''.obs;
 var profileImageLink = '';

 var isloading = false.obs;

 //textfield
 var nameController= TextEditingController();
 var passController= TextEditingController();



 changeImage(context) async{

         try{

         final img=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
         if(img ==null) return;
         profileImgPath.value=img.path;


         }on PlatformException catch(e){
           VxToast.show(context , msg: e.toString());
          }

 }

 uploadProfileImage() async {
   var filename = basename(profileImgPath.value);
   var destination = 'images/${currentUser!.uid}/$filename';
   Reference ref = FirebaseStorage.instance.ref().child(destination);
   //await ref.putFile(File(profileImgPath.value));
   //profileImageLink = await ref.getDownloadURL();

 }

 updateProfile({name, password, imgUrl}) async{
   var store = firestore.collection(usersCollection).doc(currentUser!.uid);
   await store.set({'name': name, 'password': password}, SetOptions(merge: true));
   isloading(false);

 }

=======
import 'package:austmart/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
 var profileImgPath=''.obs;
 var nameController= TextEditingController();
 var passController= TextEditingController();

 changeImage(context) async{
   final img=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
   try{
     if(img ==null) return;
     profileImgPath.value=img.path;
   }on PlatformException catch(e){
      VxToast.show(context , msg: e.toString());
   }
 }
>>>>>>> 565700a6086f8ca158a1de1d5f4de09ac17c2084
}


