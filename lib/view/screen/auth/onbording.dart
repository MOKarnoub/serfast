import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/onboarding_controller.dart';
import 'package:serfast0_1/view/widget/onboarding/custom_button.dart';
import 'package:serfast0_1/view/widget/onboarding/customdotscontroller.dart';
import 'package:serfast0_1/view/widget/onboarding/customslider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    OnBoardingControllerimp onBoardingControllerimp =
        Get.put(OnBoardingControllerimp());
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // stops: [
                //   0.1,
                //   0.4,
                //   0.7,
                //   // 0.9
                // ],
                colors: [
                  // Color.fromRGBO(0, 235, 235, 1.0),
                  // Color.fromRGBO(0, 215, 220, 1.0),
                  // Color.fromRGBO(0, 185, 185, 1.0),
                  // Color.fromRGBO(0, 170, 220, 1.0),
                  Color.fromRGBO(0, 153, 255, 1),
                  Color.fromRGBO(0, 204, 153, 1),
                  Color.fromRGBO(0, 211, 88, 1),
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    child: CustomButtonOnboarding(
                      text: "Skip",
                      onPressed: () {
                        onBoardingControllerimp.gotoLogin();
                      },
                    )),
                const SizedBox(height: 600, child: CustomSlideronBoarding())
              ],
            ),
          ),
        ), //gradiant
        Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.5 - 20,
            child: const DotControllerOnBoarding()), // Row
        Positioned(
            bottom: 40,
            right: 20,
            child: CustomButtonOnboarding(
              text: "Next",
              onPressed: () {
                onBoardingControllerimp.pushPage();
              },
            )) // Next
      ]),
    );
  }
}
