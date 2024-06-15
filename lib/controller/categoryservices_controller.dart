import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/data/datasrc/remote/categoryservicesdata.dart';

class CategoryServicesController extends GetxController {
  CategoryServicesController({required this.catID});
  final int catID;
  CategoryServicesData categoryServicesData = CategoryServicesData(Get.find());
  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await categoryServicesData.getData(catID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        data.addAll(response['prov_serv_view']);
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
