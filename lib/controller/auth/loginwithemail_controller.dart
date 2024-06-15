import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/auth/loginwithemail.dart';

abstract class LoginWithemailctrl extends GetxController {
  login();
  gotosignup();
  gotoLoginwithnumber();
  gotoForgetpassword();
}

class LoginWithemailctrlimp extends LoginWithemailctrl {
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  MyAppServices myAppServices = Get.find();
  LoginWithEmailData loginWithEmailData = LoginWithEmailData(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
  bool isShowPass = true;

  @override
  login() async {
    if (formstatekey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var respons =
          await loginWithEmailData.postData(email.text, password.text);
      print(respons);
      statusRequest = handlingData(respons);
      if (statusRequest == StatusRequest.success) {
        if (respons["Status"] == "Success") {
          myAppServices.sharedPreferences.setInt("ID", respons["data"]["ID"]);
          myAppServices.sharedPreferences
              .setString("userfname", respons['data']['FirstName'].toString());
          myAppServices.sharedPreferences
              .setString("userlname", respons['data']['LastName'].toString());
          myAppServices.sharedPreferences
              .setString("email", respons['data']['Email'].toString());
          myAppServices.sharedPreferences
              .setString("phonenumber", respons['data']['Number'].toString());
          myAppServices.sharedPreferences
              .setString("password", respons['data']['Password'].toString());
          myAppServices.sharedPreferences
              .setString("location", respons['data']['Locations'].toString());
          myAppServices.sharedPreferences
              .setString("birthday", respons['data']['Birthday'].toString());
          myAppServices.sharedPreferences
              .setString("prov_id", respons['data']['prov_id'].toString());
          Get.offNamed(AppRoute.home);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  gotosignup() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  gotoForgetpassword() {
    Get.offAllNamed(AppRoute.forgetpassword);
  }

  @override
  gotoLoginwithnumber() {
    Get.offAllNamed(AppRoute.loginWithNumber);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
