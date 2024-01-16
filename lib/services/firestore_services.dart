import 'package:austmart/consts/consts.dart';

class FirestoreServices{

  //get users data

  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
  static getChatMessages(docId){
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messageCollection)
        .orderBy('created_on',descending: false)
        .snapshots();

  }
}