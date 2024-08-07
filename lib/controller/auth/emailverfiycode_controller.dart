import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/data/datasrc/remote/auth/verfiycodesginup.dart';

abstract class EmailVerfiyCodectrl extends GetxController {
  checkCode();
  gotoSuccesse(String route, String verfiyCode);
}

class EmailVerfiyCodectrlimp extends EmailVerfiyCodectrl {
  VerfitCodeData verfitCodeData = VerfitCodeData(Get.find());
  String? email;
  StatusRequest? statusRequest;
  @override
  checkCode() {}

  @override
  gotoSuccesse(String route, String verfiyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfitCodeData.postData(email!, verfiyCode);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        Get.offNamed(AppRoute.successSignup);
      } else {
        Get.defaultDialog(
            title: "warning",
            middleText: "phone number or email is already exist");
        statusRequest == StatusRequest.failure;
      }
    }
    Get.offAllNamed(route);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    email = Get.arguments[1];
    super.onInit();
  }
}
