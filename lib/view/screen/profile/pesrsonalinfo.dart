import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/view/widget/editprofile/infolisttile.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: MyAppBar(
                title: "Contact Info",
                leading: IconButton(
                    onPressed: () {
                      // Get.offAllNamed(AppRoute.profileScreen);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded))),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(
              children: [
                InfoListtile(
                  title: 'Name',
                  ftext:
                      myAppServices.sharedPreferences.getString('userfname')!,
                  stext:
                      myAppServices.sharedPreferences.getString('userlname')!,
                  onTap: () {
                    Get.toNamed(AppRoute.editUserName);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InfoListtile(
                  title: 'Birthday',
                  ftext: myAppServices.sharedPreferences.getString('birthday')!,
                  stext: '',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
