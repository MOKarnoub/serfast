import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/edit_profile_controller.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';

class BottomSection extends StatelessWidget {
  final EditProfileController controller;
  const BottomSection({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    return Column(
      children: [
        myAppServices.sharedPreferences.getString('prov_id') != 'null'
            ? Row(
                children: [
                  Expanded(
                      child: CustomLoginButton(
                    ButtonText: "Change Password",
                    onPress: () {
                      Get.toNamed(AppRoute.changePassword);
                    },
                  )),
                  if (controller.isHeServicer) ...[
                    const SizedBox(width: 10),
                    Expanded(
                        child: CustomLoginButton(
                      ButtonText: "Change Services",
                      onPress: () {
                        Get.toNamed(AppRoute.changeMyServices);
                      },
                    )),
                  ]
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(right: 70, left: 70, top: 16),
                child: CustomLoginButton(
                  ButtonText: "Change Password",
                  onPress: () {
                    Get.toNamed(AppRoute.changePassword);
                  },
                ),
              ),
        Padding(
            padding: const EdgeInsets.only(right: 70, left: 70, top: 16),
            child: CustomLoginButton(
              ButtonText: "Delete Account",
              onPress: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  width: 300,
                  buttonsBorderRadius:
                      const BorderRadius.all(Radius.circular(40)),
                  dismissOnTouchOutside: false,
                  dismissOnBackKeyPress: true,
                  headerAnimationLoop: false,
                  animType: AnimType.scale,
                  desc: 'Do You Really Want To Delete Your Account?',
                  showCloseIcon: true,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                ).show();
              },
            ))
      ],
    );
  }
}
