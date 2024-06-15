import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/changeuserinfo.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordController = Get.put(ChangeUserInfoController());
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: MyAppBar(title: "Change Password")),
        body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Form(
              key: changePasswordController.formstatekey,
              child: ListView(
                children: [
                  Image.asset(
                    "assets/images/logoserfast.png",
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  CustomSignupTf(
                    label: "",
                    hint: "Enter Your Old Password",
                    preFixIcon: Icons.lock_outline,
                    textInputType: TextInputType.visiblePassword,
                    mycontroller: changePasswordController.oldPassword,
                    myvalidator: (value) {
                      return validInput(value!, 20, 8, "oldPassword");
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomSignupTf(
                    label: "",
                    hint: "Enter Your New Password",
                    preFixIcon: Icons.lock_outline,
                    textInputType: TextInputType.visiblePassword,
                    mycontroller: changePasswordController.newPassword,
                    myvalidator: (value) {
                      return validInput(value!, 20, 8, "Password");
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomSignupTf(
                    label: "",
                    hint: "Re Enter Your New Password",
                    preFixIcon: Icons.lock_outline,
                    textInputType: TextInputType.visiblePassword,
                    mycontroller: changePasswordController.reNewPassword,
                    myvalidator: (value) {
                      // return validInput(value!, 20, 8, "Password");
                      return changePasswordController.changePasswordValidInput(
                          value!, 20, 8, "newPassword");
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomLoginButton(
                      ButtonText: "Save",
                      onPress: () {
                        changePasswordController.changePassword(context);
                      })
                ],
              ),
            )),
      ),
      // )
    );
  }
}
