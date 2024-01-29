import 'package:austmart/consts/consts.dart';

class FirestoreServices {

  // Get user data
  static getUser(String uid) {
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  // Get chat messages
  static getChatMessages(String docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messageCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  // Get products based on category
static getProducts(String category) {
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
  }

  // Get user's cart
  static getCart(String uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }
  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }
  static searchProducts(title){
    return firestore.collection(productsCollection).where('p_name',isLessThanOrEqualTo:title).get();
  }
  static allproducts(){
    return firestore.collection(productsCollection).snapshots();
  }
  static getAllOrders(){
    return firestore.collection(ordersCollection).where('order_by',isEqualTo: currentUser!.uid).snapshots();
  }
  static getWishLists(){
    return firestore.collection(productsCollection).where('p-wishlist',arrayContains: currentUser!.uid).snapshots();
  }
  static getAllmessages()
  {
    return firestore.collection(chatsCollection).where('fromid',arrayContains: currentUser!.uid).snapshots();

  }
  static getCounts()async
  {
  var res=await Future.wait([
    firestore.collection(cartCollection).where('add_by',isEqualTo: currentUser!.uid).get().then((value) {
      return value.docs.length;
    }),
    firestore.collection(productsCollection).where('p-wishlist',arrayContains: currentUser!.uid).get().then((value) {
      return value.docs.length;
    }),
    firestore.collection(ordersCollection).where('order_by',isEqualTo: currentUser!.uid).get().then((value) {
      return value.docs.length;
    })
  ]);
  return res;

  }
}
