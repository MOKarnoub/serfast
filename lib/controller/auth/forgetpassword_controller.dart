import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';

abstract class Forgetpasswordctrl extends GetxController {
  checkEmail();
  gotoVerifyCode();
}

class Forgetpasswordctrlimp extends Forgetpasswordctrl {
  late TextEditingController email;
  @override
  checkEmail() {}

  @override
  gotoVerifyCode() {
    Get.offAllNamed(AppRoute.passwordverfiyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
