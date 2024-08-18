import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            title: const Text("Welcome"),
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
                  // Image.asset("assets/images/logoserfast.png",
                  //   height:200 ,),
                  Center(
                      child: Lottie.asset(
                    "assets/lottie/done.json",
                  )),
                  CustomLoginButton(
                    ButtonText: 'Go to home page',
                    onPress: () {
                      Get.offAllNamed(AppRoute.home);
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
