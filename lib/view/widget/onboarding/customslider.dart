import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/onboarding_controller.dart';

class CustomSlideronBoarding extends GetView<OnBoardingControllerimp> {
  const CustomSlideronBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageViewController,
      itemCount: controller.onBoardingPages.length,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemBuilder: (context, index) {
        return SizedBox(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                controller.onBoardingPages[index].imageUrl,
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                controller.onBoardingPages[index].title,
                // style: kTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  controller.onBoardingPages[index].body,
                  // style: kSubtitleStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
