import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/data/datasrc/remote/showallproviderdata.dart';

class ShowAllProvidersController extends GetxController {
  ShowAllProvidersController({required this.catID, required this.serviceID});
  ShowAllProivdersData showAllProivdersData = ShowAllProivdersData(Get.find());
  List listOfProviders = [];
  late StatusRequest statusRequest;
  late int? catID;
  late int? serviceID;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await showAllProivdersData.getData(
        catID.toString(), serviceID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        listOfProviders.addAll(response['AllProviders']);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
