import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/auth/loginwithnumber.dart';

abstract class LoginWithnumberctrl extends GetxController {
  login();
  gotosignup();
  gotoLoginwithemail();
  gotoForgetpassword();
}

class LoginWithnumberctrlimp extends LoginWithnumberctrl {
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  MyAppServices myAppServices = Get.find();
  LoginWithNumberData loginWithNumberData = LoginWithNumberData(Get.find());

  late TextEditingController phoneNumebr;
  late TextEditingController password;
  late StatusRequest statusRequest;
  bool isShowPass = true;

  @override
  login() async {
    if (formstatekey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var respons =
          await loginWithNumberData.postData(phoneNumebr.text, password.text);
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
          Get.offAllNamed(AppRoute.home);
        } else {
          print('object');
        }
        update();
      }
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
  gotoLoginwithemail() {
    Get.offAllNamed(AppRoute.loginWithEmail);
  }

  @override
  void onInit() {
    phoneNumebr = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumebr.dispose();
    password.dispose();
    super.dispose();
  }
}
