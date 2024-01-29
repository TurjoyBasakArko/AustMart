import 'package:austmart/services/firestore_services.dart';
import 'package:austmart/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/consts.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No orders yet!".text.color(darkFontGrey).makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                var orderCode = data[index]['order_code'].toString();
                var totalAmount = data[index]['total_amount'].toString();
                return ListTile(
                  leading:"${index+1}".text.fontFamily(bold).color(lightGrey).xl.make() ,
                  title: orderCode.text.color(redColor).fontFamily(semibold).make(),
                  subtitle: totalAmount.numCurrency.text.fontFamily(semibold).make(),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded),color: darkFontGrey,),
                );
              },
            );
          }
        },
      ),
    );
  }
}
