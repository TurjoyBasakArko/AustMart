import 'package:austmart/consts/consts.dart';

class FirestoreServices{
  //users data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}