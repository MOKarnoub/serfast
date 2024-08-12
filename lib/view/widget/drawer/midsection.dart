import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/view/widget/drawer/tapindrawer.dart';

class MidSection extends StatelessWidget {
  const MidSection({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    return Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 12,
            children: [
              TapInDrawer(
                title: "الرئيسية",
                icon: Icons.home_outlined,
                onTap: () {
                  Get.back();
                },
              ),
              TapInDrawer(
                title: "رصيدي",
                icon: Icons.account_balance_wallet_outlined,
                onTap: () {
                  Get.toNamed(AppRoute.balanceScreen);
                },
              ),
              TapInDrawer(
                title: "الإعدادات",
                icon: Icons.settings_outlined,
                onTap: () {
                  Get.toNamed(AppRoute.settingScreen);
                },
              ),
              myAppServices.sharedPreferences.getString('prov_id') == "null"
                  ? TapInDrawer(
                      title: "التسجيل كمقدم خدمة",
                      icon: Icons.person_outline,
                      onTap: () {
                        Get.offAllNamed(AppRoute.signUpAsProvider);
                      },
                    )
                  : Container(),
              const Divider(
                height: 1,
                thickness: 0.5,
              ),
              TapInDrawer(
                title: "الاسئلة الشائعة",
                icon: Icons.help_outline,
                onTap: () {
                  Get.toNamed(AppRoute.questionsScreen);
                },
              ),
              TapInDrawer(
                title: "من نحن",
                icon: Icons.error_outline,
                onTap: () {
                  Get.toNamed(AppRoute.aboutUsScreen);
                },
              ),
            ],
          ),
        ));
  }
}
