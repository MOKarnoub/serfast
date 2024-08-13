import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';

class AddAddressController extends GetxController {
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
    update();
  }

  gotoAddLocationPartTwo() {
    Get.toNamed(AppRoute.addlocationparttwo, arguments: {
      'lat': lat.toString(),
      'long': long.toString(),
    });
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
