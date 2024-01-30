//import 'dart:html';
//import 'dart:js';

import 'package:austmart/consts/consts.dart';
import 'package:austmart/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../consts/firebase_consts.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var totalPrice = 0.obs;
  var subcat = [];
  var isFav = false.obs;

 getSubCategories(title) async {
    subcat.clear();

    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = cataFromJson(data);
    var s =
    decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

addToCart({
     title,
     img,
     sellername,
     qty,
     tprice,
     context,
     vendorID
  }) async {
    try {
      await firestore.collection(cartCollection).doc().set({
        'title': title,
        'img': img,
        'sellername': sellername,
        'qty': qty,
        'vendor_id':vendorID,
        'tprice': tprice,
        'added_by': currentUser!.uid,
      });
    } catch (error) {
      // Show an error message using Get.snackbar
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  increaseQuantity(totalQuatity)
  {
    if(quantity.value<totalQuatity)
      {
        quantity.value++;
      }

  }
  decreaseQuantity()
  {
    if(quantity.value>0)
      {
        quantity.value--;
      }

  }
  resetValues() {
    totalPrice.value = 0;
    quantity.value = 0;
  }

  checkIfFav(data) async {
    if (data['p_wishlist'].contains(currentUser!.uid)) {
      isFav(true);
    } else {
      isFav(false);
    }
  }

  addtoWishList(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
    // Show a success message using Get.snackbar
    Get.snackbar('Wishlist', 'Added to wishlist',
        snackPosition: SnackPosition.BOTTOM);
  }

  removefromWishList(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
    // Show a success message using Get.snackbar
    Get.snackbar('Wishlist', 'Removed from favourites',
        snackPosition: SnackPosition.BOTTOM);
  }
  calculateTotalPrice(price)
  {
    totalPrice.value = price * quantity.value;
  }
}
