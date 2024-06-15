import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';

abstract class ResetPasswordCtrl extends GetxController {
  resetPassword();
  gotoSuccesse();
}

class ResetPasswordCtrlimp extends ResetPasswordCtrl {
  late TextEditingController password;
  late TextEditingController repassword;
  late List categoriesData;

  @override
  resetPassword() {}

  @override
  gotoSuccesse() {
    if (password.text == repassword.text) {
      Get.offAllNamed(AppRoute.successResetPassword);
    } else {
      print("===========================fuck=========================");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
