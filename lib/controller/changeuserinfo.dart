import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/changepassworddata.dart';
import 'package:serfast0_1/data/datasrc/remote/changephonenumberdata.dart';
import 'package:serfast0_1/data/datasrc/remote/changeusernamedata.dart';
import 'package:serfast0_1/data/datasrc/remote/chnageemaildata.dart';

class ChangeUserInfoController extends GetxController {
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  GlobalKey<FormState> formstatekey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formstatekey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formstatekey3 = GlobalKey<FormState>();
  MyAppServices myAppServices = Get.find();
  ChangePasswordData changePasswordData = ChangePasswordData(Get.find());
  ChangeUserNameData changeUserInfoData = ChangeUserNameData(Get.find());
  ChangeUserEmailData changeUserEmailData = ChangeUserEmailData(Get.find());
  ChangeUserPhoneNumberData changeUserPhoneNumberData =
      ChangeUserPhoneNumberData(Get.find());

  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController reNewPassword;
  late TextEditingController newFirstName;
  late TextEditingController newLastName;
  late TextEditingController newEmail;
  late TextEditingController newPhoneNumber;

  late StatusRequest statusRequest;
  bool doesPasswordChanged = false;
  bool doesInfoChanged = false;
  bool doesEmailChanged = false;
  bool doesPhoneNumberChanged = false;
  changePasswordValidInput(String value, int max, int min, String type) {
    if (type == "newPassword") {
      if (newPassword.text != reNewPassword.text) {
        return "Password don't match";
      }
    }
  }

  changePassword(BuildContext context) async {
    if (formstatekey.currentState!.validate()) {
      if (doesPasswordChanged == false) {
        showDialog(
          context: context,
          barrierDismissible: false,
          traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
          builder: (context) => Center(
              child: Lottie.asset("assets/lottie/loader.json",
                  width: 250, height: 150)),
        );
      }

      statusRequest = StatusRequest.loading;
      var response = await changePasswordData.getData(
          myAppServices.sharedPreferences.getInt("ID").toString(),
          newPassword.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["Status"] == "Success") {
          myAppServices.sharedPreferences
              .setString("password", response['data']['Password'].toString());
          doesPasswordChanged = true;
          AwesomeDialog(
            // ignore: use_build_context_synchronously
            context: context,
            dialogType: DialogType.success,
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
            width: 300,
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(40)),
            dismissOnBackKeyPress: true,
            animType: AnimType.scale,
            desc: 'Password Changed Successfully',
            btnOkOnPress: () {
              Get.offAllNamed(AppRoute.editProfileScreen);
            },
          ).show();
        } else {
          statusRequest == StatusRequest.failure;
        }
        update();
      }
    }
  }

  changeUserName(BuildContext context) async {
    if (formstatekey1.currentState!.validate()) {
      if (doesInfoChanged == false) {
        showDialog(
          context: context,
          barrierDismissible: false,
          traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
          builder: (context) => Center(
              child: Lottie.asset("assets/lottie/loader.json",
                  width: 250, height: 150)),
        );
      }
      statusRequest = StatusRequest.loading;
      var response = await changeUserInfoData.getData(
          myAppServices.sharedPreferences.getInt("ID").toString(),
          newFirstName.text,
          newLastName.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["Status"] == "Success") {
          print(
              '====================================================sddddddddddddddddd====================');
          myAppServices.sharedPreferences
              .setString("userfname", response['data']['FirstName'].toString());
          myAppServices.sharedPreferences
              .setString("userlname", response['data']['LastName'].toString());
          doesInfoChanged = true;
          AwesomeDialog(
            // ignore: use_build_context_synchronously
            context: context,
            dialogType: DialogType.success,
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
            width: 300,
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(40)),
            dismissOnBackKeyPress: true,
            animType: AnimType.scale,
            desc: 'Your Info Has Been Changed Successfully',
            btnOkOnPress: () {
              Get.offAllNamed(AppRoute.editProfileScreen);
            },
          ).show();
        } else {
          statusRequest == StatusRequest.failure;
        }
        update();
      }
    }
  }

  changeUserEmail(BuildContext context) async {
    if (formstatekey2.currentState!.validate()) {
      if (doesEmailChanged == false) {
        showDialog(
          context: context,
          barrierDismissible: false,
          traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
          builder: (context) => Center(
              child: Lottie.asset("assets/lottie/loader.json",
                  width: 250, height: 150)),
        );
      }
      statusRequest = StatusRequest.loading;
      var response = await changeUserEmailData.getData(
          myAppServices.sharedPreferences.getInt("ID").toString(),
          newEmail.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["Status"] == "Success") {
          print(
              '====================================================sddddddddddddddddd====================');
          myAppServices.sharedPreferences
              .setString("email", response['data']['Email'].toString());
          doesEmailChanged = true;
          Get.offAllNamed(AppRoute.emailVerfiyCode,
              arguments: [AppRoute.editProfileScreen]);
        } else {
          statusRequest == StatusRequest.failure;
          print(
              '====================================================sddddddddddddddddd====================');
        }
        update();
      }
    }
  }

  changeUserPhoneNumber(BuildContext context) async {
    if (formstatekey3.currentState!.validate()) {
      if (doesPhoneNumberChanged == false) {
        showDialog(
          context: context,
          barrierDismissible: false,
          traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
          builder: (context) => Center(
              child: Lottie.asset("assets/lottie/loader.json",
                  width: 250, height: 150)),
        );
      }
      statusRequest = StatusRequest.loading;
      var response = await changeUserPhoneNumberData.getData(
          myAppServices.sharedPreferences.getInt("ID").toString(),
          newPhoneNumber.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["Status"] == "Success") {
          print(
              '====================================================sddddddddddddddddd====================');
          myAppServices.sharedPreferences
              .setString("phonenumber", response['data']['Number'].toString());
          doesPhoneNumberChanged = true;
          Get.offAllNamed(AppRoute.emailVerfiyCode,
              arguments: [AppRoute.editProfileScreen]);
        } else {
          statusRequest == StatusRequest.failure;
          print(
              '====================================================sddddddddddddddddd====================');
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    newFirstName = TextEditingController();
    newLastName = TextEditingController();
    newEmail = TextEditingController();
    newPhoneNumber = TextEditingController();
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    reNewPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newFirstName.dispose();
    newLastName.dispose();
    newEmail.dispose();
    newPhoneNumber.dispose();
    oldPassword.dispose();
    newPassword.dispose();
    reNewPassword.dispose();
    super.dispose();
  }
}
