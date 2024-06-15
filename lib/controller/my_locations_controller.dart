import 'package:get/get.dart';

class MyLocationsController extends GetxController {
  List<String> myLocationsList = [
    "بيتي",
    "اشرفية",
    "جامعتي",
  ];
  String removeFromMyLocationsList(int index) {
    String element = myLocationsList.removeAt(index);
    update();
    return element;
  }

  void addToMyLocationsList(String element, int index) {
    myLocationsList.insert(index, element);
    update();
  }

  Rx<bool> allowTrash = false.obs;
}
