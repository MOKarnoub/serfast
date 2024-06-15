import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/valid_messages.dart';
import 'package:serfast0_1/core/services/getxservices.dart';

MyAppServices myAppServices = Get.find();

validInput(String value, int max, int min, String type) {
  if (type == "Username") {
    if (!GetUtils.isUsername(value)) {
      return "Not Valid Username";
    }
  }
  if (type == "Email") {
    if (!GetUtils.isEmail(value)) {
      return "Not Valid Email";
    }
  }
  if (type == "Phone_Number") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Not Valid Phone Number";
    }
  }
  if (type == "oldPassword") {
    if (value != myAppServices.sharedPreferences.getString('password')) {
      return 'Wrong password';
    }
  }
  if (value.isEmpty) {
    return "$type$EmptyInputMessage";
  } else if (value.length > max) {
    return "$OverflowInputMessage$max";
  } else if (value.length < min) {
    return "$LessInputMessage$min";
  }
}
