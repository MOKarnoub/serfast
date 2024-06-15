import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/view/widget/drawer/iconbutton.dart';
import 'package:serfast0_1/view/widget/drawer/midsection.dart';
import 'package:serfast0_1/view/widget/drawer/topsection.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    // final _controller = Get.put(MyDrawerController());
    return Drawer(
        child: Stack(
      // one layer for Icons Link and one for all Drawer
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TopSection(
              userName: myAppServices.sharedPreferences
                  .getString("userfname")
                  .toString(),
              phoneNumber: myAppServices.sharedPreferences
                  .getString('phonenumber')
                  .toString(),
            ),
            const Expanded(child: MidSection()),
            const SizedBox(height: 40),
          ],
        ), // All Drawer
        Positioned(
          bottom: 20,
          left: (MediaQuery.of(context).size.width / 2) - 127,
          child: SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                    imageurl: 'assets/images/whatsapp.png', onPressed: () {}),
                CustomIconButton(
                    imageurl: 'assets/images/facebook.png', onPressed: () {}),
                CustomIconButton(
                    imageurl: 'assets/images/share.png', onPressed: () {}),
              ],
            ),
          ),
        ) // Layer Links
      ],
    ));
  }
}
