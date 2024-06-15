import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/passwordverfiycode_controller.dart';

class PasswordVerfiyCode extends StatelessWidget {
  const PasswordVerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordVerfiyCodectrlimp verfiyCodectrlimp =
        Get.put(PasswordVerfiyCodectrlimp());
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            title: const Text("Verification Code"),
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
                  const SizedBox(
                    height: 30,
                  ),
                  OtpTextField(
                    borderRadius: BorderRadius.circular(12),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      verfiyCodectrlimp.gotoResetPassword();
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
