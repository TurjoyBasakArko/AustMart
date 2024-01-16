import 'package:austmart/chat_screen/Components/sender_bubble.dart';
import 'package:austmart/home_controller/chats_controller.dart';
import 'package:austmart/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatsController());

    return Scaffold(
      appBar: AppBar(
        title: "${controller.friendName}".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
                  () => controller.isloading.value
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Expanded(
                child: StreamBuilder(
                  stream: FirestoreServices.getChatMessages(controller.chatDocId.toString()),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: "Send a message...".text.color(darkFontGrey).make(),
                      );
                    } else {
                      return ListView(
                        children: snapshot.data!.docs.mapIndexed((curretValue,index) {
                          var data = snapshot.data!.docs[index];
                          return Align(
                            alignment: data['uid']==currentUser!.uid?Alignment.centerRight:Alignment.centerLeft,
                              child: senderBubble(data)
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.msgController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey,
                        ),
                      ),
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.sendMsg(controller.msgController.text);
                    controller.msgController.clear();
                  },
                  icon: const Icon(Icons.send, color: redColor),
                ),
              ],
            ).box.height(80).padding(const EdgeInsets.all(12)).margin(const EdgeInsets.only(bottom: 8)).make(),
          ],
        ),
      ),
    );
  }
}
