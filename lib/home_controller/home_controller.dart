import 'package:austmart/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
 var currentNavIndex = 0.obs;
 var username = ''.obs;
<<<<<<< HEAD
 var featuredList = [];
 var searchController=TextEditingController();



=======
 var searchController=TextEditingController();

>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
 @override
 void onInit() {
  getUsername();
  super.onInit();
 }

 void getUsername() async {
<<<<<<< HEAD
  var n = await firestore.collection(usersCollection).where("id", isEqualTo: currentUser!.uid).get().then((value) {
=======
  var n = await firestore
      .collection(usersCollection)
      .where("id", isEqualTo: currentUser!.uid)
      .get()
      .then((value) {
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
   if (value.docs.isNotEmpty) {
    username(value.docs.single['name']);
   }
  });
  username(n);
 }
}
