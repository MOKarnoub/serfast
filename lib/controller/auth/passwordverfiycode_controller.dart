import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';

abstract class PasswordVerfiyCodectrl extends GetxController {
  checkCode();
  gotoResetPassword();
}

class PasswordVerfiyCodectrlimp extends PasswordVerfiyCodectrl {
  late String verfiyCode;

  @override
  checkCode() {}

  @override
  gotoResetPassword() {
    Get.offAllNamed(AppRoute.resetPassword);
  }
}
