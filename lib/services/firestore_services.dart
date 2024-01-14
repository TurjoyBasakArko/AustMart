import 'package:austmart/consts/consts.dart';

class FirestoreServices{
<<<<<<< HEAD
  //get users data
=======
  //users data
>>>>>>> 565700a6086f8ca158a1de1d5f4de09ac17c2084
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}