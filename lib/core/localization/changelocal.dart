import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/services/getxservices.dart';

class LocalController extends GetxController {
  Locale? language;

  MyAppServices myAppServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myAppServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedprefLang = myAppServices.sharedPreferences.getString("lang");

    if (sharedprefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedprefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
