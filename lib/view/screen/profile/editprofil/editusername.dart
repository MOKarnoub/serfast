import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/changeuserinfo.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/editprofile/editprofiletf.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class EditUserName extends StatelessWidget {
  const EditUserName({super.key});

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
                title: "Edit User Name",
                leading: IconButton(
                    onPressed: () {
                      // Get.offAllNamed(AppRoute.profileScreen);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded))),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: changePasswordController.formstatekey1,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    EditProfileTF(
                      label: "First Name",
                      preFixIcon: Icons.person_outline,
                      textInputType: TextInputType.name,
                      mycontroller: changePasswordController.newFirstName,
                      myvalidator: (value) {
                        return validInput(value!, 20, 2, "Username");
                      },
                    ),
                    const SizedBox(height: 20),
                    EditProfileTF(
                      label: "Last Name",
                      preFixIcon: Icons.person_outline,
                      textInputType: TextInputType.name,
                      mycontroller: changePasswordController.newLastName,
                      myvalidator: (value) {
                        return validInput(value!, 20, 2, "Username");
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 70, left: 70, top: 30),
                      child: CustomLoginButton(
                        ButtonText: "Save",
                        onPress: () {
                          changePasswordController.changeUserName(context);
                        },
                      ),
                    ),
                  ],
                ),
              )),
        )); // appBar
  }
}
