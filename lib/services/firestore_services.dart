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
}
