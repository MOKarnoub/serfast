import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/loginwithnumber_controller.dart';
import 'package:serfast0_1/controller/profile_controller.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';
import 'package:serfast0_1/view/widget/profile_settings_icon.dart';

import '../../../core/enums/device_type.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(
        builder: (controller) => Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(70),
                    child: MyAppBar(
                      title: "Profile",
                      leading: IconButton(
                          onPressed: () {
                            Get.offAllNamed(AppRoute.home);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    )),
                body: InfoWidget(
                  builder: (context, deviceInfo) => Padding(
                    padding: EdgeInsets.only(
                        right: deviceInfo.deviceType != OurDeviceType.mobile
                            ? deviceInfo.screenWidth * 0.15
                            : 8.0,
                        left: deviceInfo.deviceType != OurDeviceType.mobile
                            ? deviceInfo.screenWidth * 0.15
                            : 8.0,
                        top: 8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top),
                            child: Column(
                              children: [
                                Card(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(80),
                                                child: controller.thereIsImage
                                                    ? Image.file(
                                                        controller.image!,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Container(
                                                        alignment:
                                                            Alignment.center,
                                                        color: Colors
                                                            .blueGrey[500],
                                                        child: const Icon(
                                                          Icons.person_rounded,
                                                          size: 80,
                                                          color: Colors.white,
                                                        ),
                                                      ))),
                                        Expanded(
                                            child: ListTile(
                                          title: Text(
                                            "${myAppServices.sharedPreferences.getString('userfname')!} ${myAppServices.sharedPreferences.getString('userlname')!}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          subtitle: Text(
                                            myAppServices.sharedPreferences
                                                .getString('email')
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ))
                                      ],
                                    )),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 46,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: CustomLoginButton(
                                    ButtonText: "Edit Profile",
                                    onPress: () {
                                      Get.toNamed(AppRoute.editProfileScreen);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              ProfileSettingsIcon(
                                icon: Icons.privacy_tip_outlined,
                                title: "قائمة مواقعي",
                                onTap: () {
                                  Get.toNamed(AppRoute.viewlocation);
                                },
                              ),
                              const SizedBox(height: 10),
                              ProfileSettingsIcon(
                                icon: Icons.settings_outlined,
                                title: "الإعدادات",
                                onTap: () {
                                  Get.toNamed(AppRoute.settingScreen);
                                },
                              ),
                              const SizedBox(height: 10),
                              ProfileSettingsIcon(
                                icon: Icons.logout,
                                title: "تسجيل الخروج",
                                onTap: () {
                                  // get.put();
                                  Get.put(LoginWithnumberctrlimp());
                                  Get.toNamed(AppRoute.loginWithNumber);
                                  myAppServices.sharedPreferences.remove("ID");
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
