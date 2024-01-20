import 'package:austmart/consts/consts.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChatsController extends GetxController {
  var chats = firestore.collection(chatsCollection);
  var friendName = Get.arguments[0];
  var friendid = Get.arguments[1];
  var senderName = Get.find<HomeController>().username.value;
  var currentid = currentUser!.uid;
  var msgController = TextEditingController();
  var isloading = false.obs;

  dynamic chatDocId;

  @override
  void onInit() {
    getChatId();
    super.onInit();
  }

  Future<void> getChatId() async {
    try {
      isloading(true);

      QuerySnapshot snapshot = await chats
          .where('users', isEqualTo: {friendid: null, currentid: null})
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        chatDocId = snapshot.docs.single.id;
      } else {
        DocumentReference newChatDocRef = await chats.add({
          'created_on': null,
          'last_msg': '',
          'users': {friendid: null, currentid: null},
          'told': '',
          'formId': '',
          'friend_name': friendName,
          'sender_name': senderName,
        });

        chatDocId = newChatDocRef.id;
      }
    } catch (e) {
      print("Error getting chat ID: $e");
    } finally {
      // Set isloading to false regardless of success or failure
      isloading(false);
    }
  }

  void sendMsg(String msg) async {
    if (msg.trim().isNotEmpty) {
      await chats.doc(chatDocId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_msg': msg,
        'told': friendid,
      });
      chats.doc(chatDocId).collection(messageCollection).doc().set(
        {
          'created_on': FieldValue.serverTimestamp(),
          'msg': msg,
          'uid': currentid,
        },
      );
    }
  }
}
