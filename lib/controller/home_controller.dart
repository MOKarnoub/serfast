import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/data/datasrc/remote/Homedata.dart';

abstract class HomeController extends GetxController {
  getData();
}

class HomeControllerimp extends HomeController {
  RxList<RxBool> opacityForText = <RxBool>[].obs;
  HomeData homeData = HomeData(Get.find());
  List categoriesList = [];
  late StatusRequest statusRequest;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categoriesList.addAll(response['data']);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
