import 'package:austmart/Order_screen/order_screen.dart';
import 'package:austmart/chat_screen/messaging_screen.dart';
import 'package:austmart/consts/list.dart';
import 'package:austmart/home_controller/auth_controller.dart';

import 'package:austmart/home_controller/profile_controller.dart';
import 'package:austmart/profile_screen/components/details_button.dart';
import 'package:austmart/profile_screen/edit_profile.dart';
import 'package:austmart/services/firestore_services.dart';
import 'package:austmart/widgets_common/loading_indicator.dart';
import 'package:austmart/wish_list/wish_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';

import 'package:austmart/widgets_common/bg_widget.dart';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../auth_screen/login_screen.dart';


class ProfileScreen extends StatelessWidget
{
  const ProfileScreen({Key?key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    var controller= Get.put(ProfileController());
    FirestoreServices.getCounts();

    return bgWidget(
        child: Scaffold(
            body:StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return const Center(
                        child:CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                    );
                  }
                  else{
                    var data=snapshot.data!.docs[0];
                    return SafeArea(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            //Edit profile section
                            Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit, color: Colors.white)).onTap(() {

                                //controller.nameController.text= data['name'];



                                Get.to(()=> EditProfile(data: data,)) ;
                              }),
                            ),

                            //User details Section

                            Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: <Widget>[

                                  data['imageUrl'] == ''
                                      ? Image.asset(imgProfile2,width: 110,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                                      : Image.network(data['imageUrl'],width: 110,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),




                                  5.widthBox,
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          "${data['name']}".text.size(18).fontFamily(semibold).white.make(),
                                          "${data['email']}".text.white.make(),
                                        ],
                                      )
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: whiteColor
                                        )),
                                    onPressed: () async {
                                      await Get.put(AuthController()).signoutMethod(context);
                                      Get.offAll(() => const LoginScreen());
                                    },
                                    child: 'logout'.text.fontFamily(semibold).white.make(),
                                  )
                                ],
                              ),

                            ),


                            20.heightBox,
                            FutureBuilder(
                                future: FirestoreServices.getCounts(),
                                builder: (BuildContext context,AsyncSnapshot snapshot)
                                {
                                  if(!snapshot.hasData){
                                    return Center(
                                      child: loadingIndicator(),
                                    );
                                  }else{
                                    var countData=snapshot.data;
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        detailsCard(width: context.screenWidth/3.4,count: countData[0].toString(),title: 'in your cart'),
                                        detailsCard(width: context.screenWidth/3.4,count: countData[1].toString(),title: 'in your wishlist'),
                                        detailsCard(width: context.screenWidth/3.4,count:countData[2].toString(),title: 'your orders')

                                      ],
                                    );

                                  }
                                }
                            ),

                            20.heightBox,
                            //buttons section
                            ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (BuildContext context, int index) {

                                return const Divider(color: lightGrey);
                              },
                              itemCount: profileButtonsList.length,
                              itemBuilder: (BuildContext context, int index){
                                return ListTile(
                                   onTap:(){
                                     switch(index){
                                       case 0:
                                         Get.to(()=>const OrderScreen());
                                         break;
                                       case 1:
                                         Get.to(()=>const WishList());
                                         break;
                                       case 1:
                                         Get.to(()=>const MessagesScreen());
                                         break;
                                     }
                                   },
                                    leading: Image.asset(profileButtonsIcon[index],width: 40,),
                                    title: "${profileButtonsList[index]}".text.fontFamily(semibold).color(darkFontGrey).make()) ;
                              },
                            ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),
                          ],
                        ),
                      ),
                    );
                  }
                }
            )
        )
    );
  }

}