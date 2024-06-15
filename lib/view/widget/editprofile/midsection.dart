import 'package:flutter/material.dart';
import 'package:serfast0_1/controller/changeuserinfo.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/editprofile/editprofiletf.dart';

class MidSection extends StatelessWidget {
  final ChangeUserInfoController changePasswordController;
  const MidSection({super.key, required this.changePasswordController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordController.formstatekey1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: EditProfileTF(
                  label: "First Name",
                  preFixIcon: Icons.person_outline,
                  textInputType: TextInputType.name,
                  mycontroller: changePasswordController.newFirstName,
                  myvalidator: (value) {
                    return validInput(value!, 20, 2, "Username");
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: EditProfileTF(
                  label: "Last Name",
                  preFixIcon: Icons.person_outline,
                  textInputType: TextInputType.name,
                  mycontroller: changePasswordController.newLastName,
                  myvalidator: (value) {
                    return validInput(value!, 20, 2, "Username");
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          EditProfileTF(
            label: "Email",
            preFixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
            mycontroller: changePasswordController.newEmail,
            myvalidator: (value) {
              return validInput(value!, 30, 10, "Email");
            },
          ),
          const SizedBox(height: 20),
          EditProfileTF(
            label: "Phone Number",
            preFixIcon: Icons.phone_outlined,
            textInputType: TextInputType.number,
            mycontroller: changePasswordController.newPhoneNumber,
            myvalidator: (value) {
              return validInput(value!, 15, 10, "Phone_Number");
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 70, left: 70, top: 30),
            child: CustomLoginButton(
              ButtonText: "Save",
              onPress: () {
                changePasswordController.changeUserName(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
