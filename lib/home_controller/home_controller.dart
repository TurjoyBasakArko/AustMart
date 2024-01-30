import 'package:austmart/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
 var currentNavIndex = 0.obs;
 var username = ''.obs;

 var featuredList = [];
 var searchController=TextEditingController();




 @override
 void onInit() {
  getUsername();
  super.onInit();
 }

 void getUsername() async {

  var n = await firestore.collection(usersCollection).where("id", isEqualTo: currentUser!.uid).get().then((value) {

   if (value.docs.isNotEmpty) {
    username(value.docs.single['name']);
   }
  });
  username(n);
 }
}
