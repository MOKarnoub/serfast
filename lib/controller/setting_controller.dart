import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool mode = true.obs;
  void changeMode() {
    if (mode.value) {
      mode.value = false;
    } else {
      mode.value = true;
    }
  }

  bool isShowingList = false;
  void changeIsShowingListLangutios() {
    if (isShowingList) {
      isShowingList = false;
      update();
    } else {
      isShowingList = true;
      update();
    }
  }
}
