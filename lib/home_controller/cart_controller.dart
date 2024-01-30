import 'package:austmart/home_controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../consts/consts.dart';

class CartController extends GetxController {
  var totalIP = 0.obs;
  var placingOrder=false.obs;
  var paymentIndex = 0.obs;
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalcodeController = TextEditingController();
  var phoneController = TextEditingController();
  late dynamic productSnapshot;


  List<Map<String, dynamic>> products = [];

  calculate(data) {
    totalIP.value = 0;
    for (var i = 0; i < data.length; ++i) {
      totalIP = totalIP + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod,required totalAmount}) async {
    placingOrder(true);
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': "233981237",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'order_by_postalcode': postalcodeController.text,
      'shipping_method': "Home Delivery",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products),
    });
    placingOrder(false);
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'img': productSnapshot[i]['img'],
<<<<<<< HEAD
=======
        'vendor_id':productSnapshot[i]['vendor_id'],
        'tprice' : productSnapshot[i]['tprice'],
>>>>>>> f5069cd71135300e854a6a263e87c7242b1f0337
        'qty': productSnapshot[i]['qty'],
        'tprice': productSnapshot[i]['tprice'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'title': productSnapshot[i]['title'],
      });
    }
    print(products);
  }
  clearCart(){
    for(var i=0;i<productSnapshot.length;i++)
      {
        firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
      }
  }
}
