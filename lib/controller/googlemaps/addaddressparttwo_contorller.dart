import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/locationdata.dart';

class AddAddressParttowController extends GetxController {
  GlobalKey<FormState> fs1 = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.loading;
  AddLocationData addLocationData = AddLocationData(Get.find());
  MyAppServices myAppServices = Get.find();
  late TextEditingController locationName;
  late TextEditingController buildingNumber;
  late TextEditingController notes;
  String? lat;
  String? long;

  addLocation() async {
    if (fs1.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addLocationData.postData(
        locationName.text,
        long!,
        lat!,
        myAppServices.sharedPreferences.getInt("ID").toString(),
        buildingNumber.text,
        notes.text,
      );
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["Status"] == "Success") {
          Get.offAllNamed(AppRoute.home);
        } else if (response["Status"] == "Failed") {
          statusRequest == StatusRequest.failure;
          update();
        }
      }
      update();
    }
  }

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  @override
  void onInit() {
    locationName = TextEditingController();
    buildingNumber = TextEditingController();
    notes = TextEditingController();
    initialData();
    super.onInit();
  }
}
