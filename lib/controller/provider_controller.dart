import 'package:get/get.dart';
import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/data/datasrc/remote/providerdata.dart';

class ProvController extends GetxController {
  ProvController({required this.catID});
  ProvData testData = ProvData(Crud());
  List listOfProviders = [];
  late StatusRequest statusRequest;
  late int? catID;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(catID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        listOfProviders.addAll(response['listOfProviders']);
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
