import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/editprofile/infolisttile.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

import '../../../core/enums/device_type.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: MyAppBar(
                title: "Contact Info",
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded))),
          ),
          body: InfoWidget(
            builder: (context, deviceInfo) => Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: deviceInfo.deviceType != OurDeviceType.mobile
                    ? deviceInfo.screenWidth * 0.15
                    : 8.0,
              ),
              child: ListView(
                children: [
                  InfoListtile(
                    title: 'Email',
                    ftext: myAppServices.sharedPreferences.getString('email')!,
                    stext: '',
                    onTap: () {
                      Get.toNamed(AppRoute.editUserEmail);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoListtile(
                    title: 'Phone number',
                    ftext: myAppServices.sharedPreferences
                        .getString('phonenumber')!,
                    stext: '',
                    onTap: () {
                      Get.toNamed(AppRoute.editUserPhoneNumber);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
