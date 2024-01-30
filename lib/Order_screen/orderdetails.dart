import 'package:austmart/Order_screen/order_place_details.dart';
import 'package:austmart/Order_screen/order_status.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../consts/consts.dart';

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              orderStatus(
                color: redColor,
                icon: Icons.done,
                title: "Order Placed",
                showDone: data['order_placed'],
              ),
              orderStatus(
                color: Colors.blue,
                icon: Icons.thumb_up,
                title: "Confirmed",
                showDone: data['order_confirmed'],
              ),
              orderStatus(
                color: Colors.yellow,
                icon: Icons.car_crash,
                title: "On Delivery",
                showDone: data['order_delivery'],
              ),
              orderStatus(
                color: Colors.purple,
                icon: Icons.done,
                title: "Delivered",
                showDone: data['order_delivered'],
              ),
              const Divider(),
              10.heightBox,
              Column(
                children: [
                  orderPlaceDetails(
                    d1: data['order_code'],
                    d2: data['shippin_method'],
                    title1: "Order Date",
                    title2: "Shipping Method",
                  ),
                  orderPlaceDetails(
                    d1: intl.DateFormat().add_yMd().format((data['order_date'].toDate())),
                    d2: data['payment_method'],
                    title1: "Order Date",
                    title2: "Payment Method",
                  ),
                  orderPlaceDetails(
                    d1: "Unpaid",
                    d2: "Order Placed",
                    title1: "Order Status",
                    title2: "Payment Method",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Shipping Address".text.fontFamily(semibold).make(),
                            "${(data['order_by_name'])}".text.make(),
                            "${(data['order_by_email'])}".text.make(),
                            "${(data['order_by_address'])}".text.make(),
                            "${(data['order_by_city'])}".text.make(),
                            "${(data['order_by_state'])}".text.make(),
                            "${(data['order_by_phone'])}".text.make(),
                            "${(data['order_by_postalcode'])}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Total Amount".text.fontFamily(semibold).make(),
                              "${data['total_amount']}".text.color(redColor).fontFamily(bold).make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ).box.outerShadowSm.white.make(),
              const Divider(),
              10.heightBox,
              "Ordered Product".text.size(16).color(darkFontGrey).fontFamily(semibold).makeCentered(),
              10.heightBox,
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  data['orders'].length,
                      (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                          d1: "${data['orders'][index]['qty']}x",
                          d2: "Refundable",
                          title1: data['orders'][index]['title'],
                          title2: data['orders'][index]['tprice'],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 30,
                            height: 20,
                            color: Color(data['orders'][index]['color']),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ).toList(),
              ).box.outerShadowMd.white.margin(const EdgeInsets.only(bottom: 4)).make(),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
