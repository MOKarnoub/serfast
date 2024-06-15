import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/onboarding_controller.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerimp>(
        builder: ((controller) => Row(
                children: List.generate(
              controller.onBoardingPages.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.only(left: 3),
                duration: const Duration(milliseconds: 500),
                width: controller.currentPage == index ? 36 : 12,
                height: 8,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: controller.currentPage == index
                      ? Colors.white
                      : const Color.fromRGBO(1, 1, 1, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ))));
  }
}
