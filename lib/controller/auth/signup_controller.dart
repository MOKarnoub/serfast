import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/auth/signup.dart';

abstract class Signupctrl extends GetxController {
  signup();
  gotoLoginwithnumber();
}

class Signupctrlimp extends Signupctrl {
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  MyAppServices myAppServices = Get.find();
  SignupData signupData = SignupData(Get.find());

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  late TextEditingController location;
  late StatusRequest statusRequest;

  @override
  gotoLoginwithnumber() {
    Get.offAllNamed(AppRoute.loginWithNumber);
  }

  @override
  signup() async {
    if (formstatekey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupData.postData(
        firstName.text,
        lastName.text,
        email.text,
        password.text,
        phoneNumber.text,
        location.text,
      );
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["Status"] == "Success") {
          myAppServices.sharedPreferences.setInt("ID", response["data"]["ID"]);
          myAppServices.sharedPreferences
              .setString("userfname", response['data']['FirstName'].toString());
          myAppServices.sharedPreferences
              .setString("userlname", response['data']['LastName'].toString());
          myAppServices.sharedPreferences
              .setString("email", response['data']['Email'].toString());
          myAppServices.sharedPreferences
              .setString("phonenumber", response['data']['Number'].toString());
          myAppServices.sharedPreferences
              .setString("password", response['data']['Password'].toString());
          myAppServices.sharedPreferences
              .setString("location", response['data']['Locations'].toString());
          myAppServices.sharedPreferences
              .setString("birthday", response['data']['Birthday'].toString());
          myAppServices.sharedPreferences
              .setString("prov_id", response['data']['prov_id'].toString());
          Get.offNamed(AppRoute.emailVerfiyCode,
              arguments: [AppRoute.successSignup]);
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
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    location = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    location.dispose();
    super.dispose();
  }
}
