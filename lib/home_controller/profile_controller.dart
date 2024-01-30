
//import 'dart:html';
import 'package:austmart/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
 var oldpassController= TextEditingController();
 var newpassController= TextEditingController();



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
 changeAuthPassword({email,password,newpassword})async{
   final cred = EmailAuthProvider.credential(email: email, password: password);

   await currentUser!.reauthenticateWithCredential(cred).then((value){
     currentUser!.updatePassword(newpassword);

     }).catchError((error){
       print(error.toString());
   });

   }
<<<<<<< HEAD
=======

>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
}


