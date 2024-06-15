import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/resetpassword_controller.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordCtrlimp resetPasswordCtrl = Get.put(ResetPasswordCtrlimp());
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            title: const Text("Reset Password"),
            centerTitle: true,
          ),
          body: Container(
            width: 1000,
            height: 1000,
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.transparent,
            child: Form(
              child: ListView(
                children: [
                  Image.asset(
                    "assets/images/logoserfast.png",
                    height: 200,
                  ),
                  CustomSignupTf(
                    label: "Password",
                    hint: "Enter Your Password",
                    preFixIcon: Icons.lock_outline,
                    textInputType: TextInputType.visiblePassword,
                    mycontroller: resetPasswordCtrl.password,
                    myvalidator: (value) {
                      return validInput(value!, 20, 8, "Password");
                    },
                  ),
                  CustomSignupTf(
                    label: "Password",
                    hint: "Re Enter Your Password",
                    preFixIcon: Icons.lock_outline,
                    textInputType: TextInputType.visiblePassword,
                    mycontroller: resetPasswordCtrl.repassword,
                    myvalidator: (value) {
                      return validInput(value!, 20, 8, "Password");
                    },
                  ),
                  CustomLoginButton(
                    ButtonText: "Submite",
                    onPress: () {
                      resetPasswordCtrl.gotoSuccesse();
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
