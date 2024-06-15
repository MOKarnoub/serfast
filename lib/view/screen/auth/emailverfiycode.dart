import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/emailverfiycode_controller.dart';

class EmailVerfiyCode extends StatelessWidget {
  const EmailVerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    String route = Get.arguments[0];
    EmailVerfiyCodectrlimp emailVerfiyCodectrlimp =
        Get.put(EmailVerfiyCodectrlimp());
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            title: const Text("Email Verification Code"),
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
                      AwesomeDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        dialogType: DialogType.success,
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                        width: 300,
                        buttonsBorderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        dismissOnBackKeyPress: true,
                        animType: AnimType.scale,
                        desc: 'Your email has been successfully confirmed',
                        btnOkOnPress: () {
                          emailVerfiyCodectrlimp.gotoSuccesse(route);
                        },
                      ).show();
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
