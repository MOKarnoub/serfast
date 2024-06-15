import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serfast0_1/core/services/getxservices.dart';

class ProfileController extends GetxController {
  MyAppServices myAppServices = Get.find();
  bool thereIsImage = false;
  File? image;
  Future pickImageFromGalary(BuildContext context) async {
    final selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(selectedImage!.path);
    thereIsImage = true;

    update();
  }

  Future pickImageFromCamera(BuildContext context) async {
    final selectedImag =
        await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(selectedImag!.path);
    thereIsImage = true;
    update();
  }
}
