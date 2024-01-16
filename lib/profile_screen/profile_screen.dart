import 'package:austmart/consts/list.dart';
import 'package:austmart/home_controller/auth_controller.dart';
import 'package:austmart/home_controller/home_controller.dart';
import 'package:austmart/home_controller/profile_controller.dart';
import 'package:austmart/profile_screen/components/details_button.dart';
import 'package:austmart/profile_screen/edit_profile.dart';
import 'package:austmart/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:austmart/consts/consts.dart';
import 'package:austmart/widgets_common/applogo_widgets.dart';
import 'package:austmart/widgets_common/bg_widget.dart';
import 'package:austmart/widgets_common/custom_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../auth_screen/login_screen.dart';


class ProfileScreen extends StatelessWidget
{
  const ProfileScreen({Key?key}):super(key:key);


  @override
  Widget build(BuildContext context) {
    var controller= Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body:StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),

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

                          controller.nameController.text= data['name'];
                          //controller.passController.text= data['password'];


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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(width: context.screenWidth/3.4,count: data['cart_count'],title: 'in your cart'),
                          detailsCard(width: context.screenWidth/3.4,count: data['wishlist_count'],title: 'in your wishlist'),
                          detailsCard(width: context.screenWidth/3.4,count: data['order_count'],title: 'your orders')

                        ],
                      ),
                      20.heightBox,
                      //buttons section
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {

                          return Divider(color: lightGrey);
                        },
                        itemCount: profileButtonsList.length,
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
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