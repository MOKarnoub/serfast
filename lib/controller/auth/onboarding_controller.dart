import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/static/static.dart';

abstract class OnBoardingController extends GetxController {
  pushPage();
  gotoLogin();
  onPageChanged(int pageIndex);
}

class OnBoardingControllerimp extends OnBoardingController {
  MyAppServices myAppServices = Get.find();
  int currentPage = 0;
  var onBoardingPages = onBoardingPage;
  late PageController pageViewController;
  @override
  pushPage() {
    currentPage++;
    if (currentPage > onBoardingPages.length - 1) {
      myAppServices.sharedPreferences.setString("OnBord", "Done");
      gotoLogin();
    } else {
      pageViewController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
    update();
  }

  @override
  onPageChanged(int pageIndex) {
    currentPage = pageIndex;
    update();
  }

  @override
  void onInit() {
    pageViewController = PageController();
    super.onInit();
  }

  @override
  gotoLogin() {
    Get.offNamed(AppRoute.loginWithNumber);
  }
}
