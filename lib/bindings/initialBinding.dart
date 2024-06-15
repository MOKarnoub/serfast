import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/loginwithemail_controller.dart';
import 'package:serfast0_1/controller/auth/loginwithnumber_controller.dart';
import 'package:serfast0_1/controller/auth/signup_controller.dart';
import 'package:serfast0_1/core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => Signupctrlimp());
    Get.lazyPut(
      () => LoginWithemailctrlimp(),
    );
    Get.lazyPut(
      () => LoginWithnumberctrlimp(),
    );
  }
}
