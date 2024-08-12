import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/auth/signup_asprovider.dart';
import 'package:serfast0_1/data/datasrc/remote/categoriesServiceNamesdata.dart';
import 'package:serfast0_1/data/datasrc/remote/catnamesdata.dart';

import '../../data/model/Service.dart';

abstract class SignupAsProviderCtrl extends GetxController {}

class SignupAsProviderCtrlImp extends SignupAsProviderCtrl {
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  MyAppServices myAppServices = Get.find();
  CatNamesData catNamesData = CatNamesData(Get.find());
  CategoriesServiceNames categoriesServiceNames =
      CategoriesServiceNames(Get.find());
  SignupAsProviderData signupAsProviderData = SignupAsProviderData(Get.find());
  late TextEditingController about;
  // late List<String> serviceName;
  late String serviceName1;
  late String serviceName2;
  late String serviceName3;
  late String categoryName1;
  late String categoryName2;
  late String categoryName3;
  late StatusRequest statusRequest;
  List<String> categoriesList = [];

  RxList<ServiceProvider> listOfService = [
    ServiceProvider(category: ''.obs, service: ''.obs),
  ].obs;

  late Map<String, List<String>> service = {};
  late Map<String, dynamic> responseData = {};
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await catNamesData.getData();
    // print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        for (var element in response['data']) {
          if (element is String) {
            categoriesList.add(element);
          }
        }
        update();
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getData1() async {
    statusRequest = StatusRequest.loading;
    final response = await categoriesServiceNames.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["Status"] == "Success") {
        responseData = response['data'];
        responseData.forEach((key, values) {
          if (service.containsKey(key)) {
            service[key]!.addAll(values);
          } else {
            service[key] = List.from(values);
          }
        });
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  void gotoParttwo() {
    switch (listOfService.length) {
      case 0:
        break;
      case 1:
        serviceName1 = listOfService[0].service.toString();
        serviceName2 = 'null';
        serviceName3 = 'null';
        categoryName1 = listOfService[0].category.toString();
        categoryName2 = 'null';
        categoryName3 = 'null';
        break;
      case 2:
        serviceName1 = listOfService[0].service.toString();
        serviceName2 = listOfService[1].service.toString();
        serviceName3 = 'null';
        categoryName1 = listOfService[0].category.toString();
        categoryName2 = listOfService[1].category.toString();
        categoryName3 = 'null';
        break;
      case 3:
        serviceName1 = listOfService[0].service.toString();
        serviceName2 = listOfService[1].service.toString();
        serviceName3 = listOfService[2].service.toString();
        categoryName1 = listOfService[0].category.toString();
        categoryName2 = listOfService[1].category.toString();
        categoryName3 = listOfService[2].category.toString();
        break;
      default:
        break;
    }
    print(serviceName1 + " " + serviceName2 + " " + serviceName3);
    print(categoryName1 + " " + categoryName2 + " " + categoryName3);
    print(about.text);
    if (formstatekey.currentState!.validate()) {
      Get.toNamed(AppRoute.signUpAsProviderParttwo, arguments: {
        "serviceName1": serviceName1,
        "serviceName2": serviceName2,
        "serviceName3": serviceName3,
        "categoryName1": categoryName1,
        "categoryName2": categoryName2,
        "categoryName3": categoryName3,
        "about": about.text,
      });
    }
    // update();
  }

  @override
  void onInit() {
    getData();
    getData1();
    about = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    about.dispose();
    super.dispose();
  }

  void addList() {
    listOfService.add(ServiceProvider(category: ''.obs, service: ''.obs));
    update();
  }

  void removeList(int index) {
    listOfService.removeAt(index);
    update();
  }
}
