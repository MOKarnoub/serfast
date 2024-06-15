import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/forgetpassword_controller.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Forgetpasswordctrlimp forgetpasswordCtrl = Get.put(Forgetpasswordctrlimp());
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            title: const Text("Forget Password"),
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
                    label: "Email",
                    hint: "Enter Your Email",
                    preFixIcon: Icons.email_outlined,
                    textInputType: TextInputType.emailAddress,
                    mycontroller: forgetpasswordCtrl.email,
                    myvalidator: (value) {
                      return validInput(value!, 30, 10, "Email");
                    },
                  ),
                  CustomLoginButton(
                    ButtonText: "Check",
                    onPress: () {
                      forgetpasswordCtrl.gotoVerifyCode();
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
