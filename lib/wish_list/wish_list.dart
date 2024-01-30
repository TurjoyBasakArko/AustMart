import 'package:austmart/services/firestore_services.dart';
import 'package:austmart/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../consts/consts.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getWishLists(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No items in wishlist!".text.color(darkFontGrey).makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(
                    "${data[index]['img'][0]}",
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  title: "${data[index]['p_name']})"
                      .text
                      .fontFamily(semibold)
                      .size(16)
                      .make(),
                  subtitle: "${data[index]['p_price']}"
                      .text
                      .fontFamily(semibold)
                      .size(16)
                      .make(),
                  trailing: const Icon(
                    Icons.favorite,
                    color: redColor,
                  ).onTap(() async{
                   await firestore.collection(productsCollection).doc(data[index].id).set({
                     'p_wishlist':FieldValue.arrayRemove([currentUser!.uid])
                   },SetOptions(merge: true)
                   );
                  }),
                );
              },
            );
          }
        },
      ),
    );
  }
}
