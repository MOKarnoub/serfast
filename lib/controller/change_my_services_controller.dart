import 'package:get/get.dart';

class ChangeMyServicesController extends GetxController {
  List<List<String>> listOfMyServices = [
    ["كهرباء", "تمديد كهرباء"],
    ["مياه", "تمديد مياهء"],
    ["سباكة", "تمديد سباكة"],
  ];
  List<String> categories = [
    "Electric",
    "Medical",
    "AC",
    "Cleaning",
    "Decoration",
    "AN",
    "BA",
    "CA",
  ];
  List<List<String>> whichList = [
    ["برادات", "مكيفات"],
    ["ممرض", "مسعف"],
    ["AC", "AD"],
    ["VCE", "CLE"],
    ["DEC", "DEA"],
    ["AD", "Da2"],
    ["AB", "AB2"],
    ["CA", "CA2"],
  ];
  int? selectedCategory = 0;
  int? selectedList = 0;
  void setSelectedCategory(int? item) {
    selectedCategory = item;
    update();
  }

  void setSelectedList(int? item) {
    selectedList = item;
    update();
  }
}
