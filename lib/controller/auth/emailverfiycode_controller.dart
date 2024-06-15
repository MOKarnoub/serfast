import 'package:get/get.dart';

abstract class EmailVerfiyCodectrl extends GetxController
{
  checkCode();
  gotoSuccesse(String route);
}

class EmailVerfiyCodectrlimp extends EmailVerfiyCodectrl
{
  
  late String verfiyCode;

  @override
  checkCode() {
  }

  @override
  gotoSuccesse(String route) {
    Get.offAllNamed(route);
  }


  


}
