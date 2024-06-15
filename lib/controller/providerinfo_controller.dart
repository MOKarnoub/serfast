import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/data/datasrc/remote/providerinfodata.dart';
import 'package:serfast0_1/data/model/services.dart';

class ProviderInfoController extends GetxController {
  ProviderInfoController(
      {required this.catID, required this.serviceID, required this.providerID});
  final int catID;
  final int providerID;
  final int serviceID;
  ProviderInfoData providerInfoData = ProviderInfoData(Get.find());
  List listOfProviders = [];

  late StatusRequest statusRequest;
  var selectedIndex = 0.obs;
  late PageController pageController;
  RxList<RxBool> opacityForText = <RxBool>[].obs;
  List<ServicesModel> servicesList = [
    ServicesModel(
      serviceId: 1,
      serviceName: "تمديد مياه",
    ),
    ServicesModel(
      serviceId: 2,
      serviceName: "اصلاح كهرباء",
    ),
    ServicesModel(
      serviceId: 3,
      serviceName: "تمديد كهرباء",
    ),
  ];
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await providerInfoData.getData(
        catID.toString(), serviceID.toString(), providerID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        listOfProviders.addAll(response['Providers_Info']);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
