import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/changeuserinfo.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/editprofile/editprofiletf.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

import '../../../../core/enums/device_type.dart';

class EditUserEmail extends StatelessWidget {
  const EditUserEmail({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeUserInfoController changePasswordController =
        Get.put(ChangeUserInfoController());
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: MyAppBar(
                title: "Edit Email",
                leading: IconButton(
                    onPressed: () {
                      // Get.offAllNamed(AppRoute.profileScreen);
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
                child: Form(
                  key: changePasswordController.formstatekey2,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      EditProfileTF(
                        label: "Email",
                        preFixIcon: Icons.email_outlined,
                        textInputType: TextInputType.emailAddress,
                        mycontroller: changePasswordController.newEmail,
                        myvalidator: (value) {
                          return validInput(value!, 30, 10, "Email");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 70, left: 70, top: 180),
                        child: CustomLoginButton(
                          ButtonText: "Save",
                          onPress: () {
                            changePasswordController.changeUserEmail(context);
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
