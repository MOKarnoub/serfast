import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/changeuserinfo.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/editprofile/editprofiletf.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class EditUserPhoneNumber extends StatelessWidget {
  const EditUserPhoneNumber({super.key});

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
                title: "Edit Phone Number",
                leading: IconButton(
                    onPressed: () {
                      // Get.offAllNamed(AppRoute.profileScreen);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded))),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: changePasswordController.formstatekey3,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    EditProfileTF(
                      label: "Phone Number",
                      preFixIcon: Icons.phone_outlined,
                      textInputType: TextInputType.phone,
                      mycontroller: changePasswordController.newPhoneNumber,
                      myvalidator: (value) {
                        return validInput(value!, 30, 10, "Phone_Number");
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 70, left: 70, top: 180),
                      child: CustomLoginButton(
                        ButtonText: "Save",
                        onPress: () {
                          changePasswordController
                              .changeUserPhoneNumber(context);
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
