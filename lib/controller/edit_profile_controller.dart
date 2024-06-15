import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  late TextEditingController controllerText;
  @override
  void onInit() {
    controllerText = TextEditingController();
    super.onInit();
  }

  bool isHeServicer = true;
  List<String> myListOfLocationsAsProvider = [
    "موكامبو",
    "شارع النيل",
    "فرقان",
    "اشرفية",
    "اعظمية",
    "شهباء",
    "زهراء",
    "ميدان",
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
  int? selectedLocation = 0;
  void setSelectedCategory(int? item) {
    selectedCategory = item;
    update();
  }

  void setSelectedList(int? item) {
    selectedList = item;
    update();
  }

  void setSelectedLocation(int? item) {
    selectedLocation = item;
    update();
  }
}
