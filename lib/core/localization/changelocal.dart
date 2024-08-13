import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  requestPremissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("warnning", "turn on location");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("warnning", "Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  void onInit() {
    requestPremissionLocation();

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
