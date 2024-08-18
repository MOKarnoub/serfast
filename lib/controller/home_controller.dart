import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/Homedata.dart';
import 'package:serfast0_1/data/datasrc/remote/orderdata.dart';
import 'package:serfast0_1/data/model/lastmodel.dart';

abstract class HomeController extends GetxController {
  getData();
}

class HomeControllerimp extends HomeController {
  MyAppServices myAppServices = Get.find();
  RxList<RxBool> opacityForText = <RxBool>[].obs;
  OrderData orderData = OrderData(Get.find());
  HomeData homeData = HomeData(Get.find());
  List categoriesList = [];
  late List<Orderdd> order = [];
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

  getData1() async {
    statusRequest = StatusRequest.loading;
    var response = await orderData
        .getDetailes(myAppServices.sharedPreferences.getInt("ID").toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        List data = response['data'];
        order.addAll(data.map((e) => Orderdd.fromJson(e)));
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    getData1();
    print(myAppServices.sharedPreferences.getInt("ID").toString());
    super.onInit();
  }
}
