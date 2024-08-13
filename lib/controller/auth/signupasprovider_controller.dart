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

abstract class SignupAsProviderCtrl extends GetxController {
  signup();
  gotoLoginwithnumber();
}

class SignupAsProviderCtrlImp extends SignupAsProviderCtrl {
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  MyAppServices myAppServices = Get.find();
  CatNamesData catNamesData = CatNamesData(Get.find());
  CategoriesServiceNames categoriesServiceNames =
      CategoriesServiceNames(Get.find());
  SignupAsProviderData signupAsProviderData = SignupAsProviderData(Get.find());
  late TextEditingController location;
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

  @override
  gotoLoginwithnumber() {
    Get.offAllNamed(AppRoute.home);
  }

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

  @override
  signup() async {
    switch (listOfService.length) {
      case 0:
        break;
      case 1:
        serviceName1 = listOfService[0].service.toString();
        serviceName2 = '';
        serviceName3 = '';
        categoryName1 = listOfService[0].category.toString();
        categoryName2 = '';
        categoryName3 = '';
        break;
      case 2:
        serviceName1 = listOfService[0].service.toString();
        serviceName2 = listOfService[1].service.toString();
        serviceName3 = '';
        categoryName1 = listOfService[0].category.toString();
        categoryName2 = listOfService[1].category.toString();
        categoryName3 = '';
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

    if (formstatekey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupAsProviderData.postData(location.text,
          myAppServices.sharedPreferences.getInt("ID").toString());
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["Status"] == "Success") {
          Get.offNamed(AppRoute.successSignup);
        } else {
          statusRequest == StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    getData();
    getData1();
    location = TextEditingController();
    about = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    location.dispose();
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
