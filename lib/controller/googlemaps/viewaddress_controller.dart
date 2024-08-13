import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/locationdata.dart';
import 'package:serfast0_1/data/model/locationviewmodel.dart';

class ViewAddressController extends GetxController {
  late StatusRequest statusRequest;
  AddLocationData addLocationData = AddLocationData(Get.find());
  MyAppServices myAppServices = Get.find();
  List<LocationViewModel> locations = [];
  Rx<bool> allowTrash = false.obs;

  removeData(int locationid) async {
    addLocationData.removeData(locationid.toString());
    locations.removeWhere((elemet) => elemet.locId == locationid);
    update();
  }

  getLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addLocationData.getData(
      myAppServices.sharedPreferences.getInt("ID").toString(),
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        List data = response['data'];
        locations.addAll(data.map((e) => LocationViewModel.fromJson(e)));
      } else if (response["Status"] == "Failed") {
        statusRequest == StatusRequest.failure;
        update();
      }
    }
    update();
  }

  void addToMyLocationsList(String element, int index) {
    locations.insert(index, element as LocationViewModel);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }
}
