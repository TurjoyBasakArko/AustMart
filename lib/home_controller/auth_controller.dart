import 'package:austmart/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../consts/firebase_consts.dart';
class AuthController extends GetxController {
  final FirebaseAuth Auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

    } on FirebaseAuthException catch (e) {
      VxToast.show(context,msg:e.toString());
      return userCredential;
    }
  }

  Future<UserCredential?> signUpmethod({email,password,context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      VxToast.show(context , msg:e.toString());
      return userCredential;
    }
  }

  storeUserData({ name,  password,  email}) async {
    DocumentReference store = await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageurl': '',
      'id':currentUser!.uid,
      'cart_count':"00",
      'wishlist_count':"00",
      'order_count':"00",
    });
  }
  signoutMethod({context})async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}