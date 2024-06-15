import 'package:get/get.dart';
import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/data/datasrc/remote/servicesdata.dart';

class ServController extends GetxController {
  ServController({required this.catID});
  ServData servData = ServData(Crud());
  List listOfServices = [];
  late StatusRequest statusRequest;
  late int catID;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await servData.getData(catID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        listOfServices.addAll(response['listOfServices']);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
