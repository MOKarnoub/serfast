import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/onboarding_controller.dart';

// ignore: must_be_immutable
class CustomButtonOnboarding extends StatelessWidget {
  void Function()? onPressed;
  String? text;
  CustomButtonOnboarding({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerimp>(
        builder: ((controller) => MaterialButton(
              onPressed: onPressed,
              child: Text(
                controller.currentPage == 2 && text == "Next"
                    ? "Start"
                    : "$text",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "fontFamily: 'CM Sans Serif'"),
              ),
            )));
  }
}
