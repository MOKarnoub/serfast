import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tapController;

  @override
  void onInit() {
    super.onInit();
    tapController = TabController(vsync: this, length: 2);
  }

  @override
  void onClose() {
    tapController.dispose();
    super.onClose();
  }
}
