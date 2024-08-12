import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/auth/signup_asprovider.dart';

class SignupasproviderparttwoController extends GetxController {
  MyAppServices myAppServices = Get.find();
  SignupAsProviderData signupAsProviderData = SignupAsProviderData(Get.find());
  late String about;
  late String serviceName1;
  late String serviceName2;
  late String serviceName3;
  late String categoryName1;
  late String categoryName2;
  late String categoryName3;
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completercontroller;
  List<Marker> markers = [];
  Position? postion;
  CameraPosition? kGooglePlex;
  double? lat;
  double? long;

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.success;
    update();
  }

  addMarkers(LatLng latlang) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latlang));
    lat = latlang.latitude;
    long = latlang.longitude;
    print(lat);
    print(long);
    update();
  }

  initialData() {
    serviceName1 = Get.arguments['serviceName1'];
    serviceName2 = Get.arguments['serviceName2'];
    serviceName3 = Get.arguments['serviceName3'];
    categoryName1 = Get.arguments['categoryName1'];
    categoryName2 = Get.arguments['categoryName2'];
    categoryName3 = Get.arguments['categoryName3'];
    about = Get.arguments['about'];
  }

  signup() async {
    statusRequest = StatusRequest.loading;
    var response = await signupAsProviderData.postData(
        categoryName1,
        categoryName2,
        categoryName3,
        serviceName1,
        serviceName2,
        serviceName3,
        myAppServices.sharedPreferences.getInt("ID").toString(),
        about,
        long.toString(),
        lat.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Sucess") {
        myAppServices.sharedPreferences
            .setString("prov_id", response['provider_id'].toString());
        Get.offNamed(AppRoute.home);
        update();
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    initialData();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
