import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/auth/signup_asprovider.dart';

import '../../data/model/Service.dart';

abstract class SignupAsProviderCtrl extends GetxController {
  signup();
  gotoLoginwithnumber();
}

class SignupAsProviderCtrlImp extends SignupAsProviderCtrl {
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  MyAppServices myAppServices = Get.find();
  SignupAsProviderData signupAsProviderData = SignupAsProviderData(Get.find());
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController services;
  late TextEditingController phoneNumber;
  late TextEditingController location;
  late StatusRequest statusRequest;

  @override
  gotoLoginwithnumber() {
    Get.offAllNamed(AppRoute.home);
  }

  RxList<ServiceProvider> listOfService = [
    ServiceProvider(category: ''.obs, service: ''.obs),
  ].obs;

  List<String> categories = ['Category A', 'Category B', 'Category C'];
  Map<String, List<String>> service = {
    'Category A': ['Item A', 'Item A1', 'Item A2'],
    'Category B': ['Item B', 'Item B1', 'Item B2'],
    'Category C': ['Item C', 'Item C1', 'Item C2'],
  };

  @override
  signup() async {
    if (formstatekey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupAsProviderData.postData(
          firstName.text,
          lastName.text,
          services.text,
          phoneNumber.text,
          location.text,
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
    firstName = TextEditingController();
    lastName = TextEditingController();
    services = TextEditingController();
    phoneNumber = TextEditingController();
    location = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    services.dispose();
    phoneNumber.dispose();
    location.dispose();
    super.dispose();
  }
}
