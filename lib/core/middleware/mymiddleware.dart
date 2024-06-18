import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/services/getxservices.dart';

class MyMiddleware extends GetMiddleware {
  MyAppServices myAppServices = Get.find();

  @override
  int? get priority => 1;

  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route) {
    // if (myAppServices.sharedPreferences.getString("OnBord") == "Done") {
    //   return const RouteSettings(name: AppRoute.signup);
    // }
    if (myAppServices.sharedPreferences.getInt("ID") != null) {
      return const RouteSettings(name: AppRoute.home);
    }
  }
}
