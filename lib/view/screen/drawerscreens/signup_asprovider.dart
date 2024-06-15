import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/signupasprovider_controller.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';

class SignUpAsProvider extends GetView<SignupAsProviderCtrlImp> {
  const SignUpAsProvider({super.key});
  @override
  Widget build(BuildContext context) {
    SignupAsProviderCtrlImp signupCtrl = Get.put(SignupAsProviderCtrlImp());
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Sgin Up As Provider"),
            centerTitle: true,
          ),
          body: Container(
            width: double.infinity,
            height: 1000,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: signupCtrl.formstatekey,
              child: ListView(
                children: [
                  Image.asset(
                    "assets/images/logoserfast.png",
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomSignupTf(
                          label: "Name",
                          hint: "Fisrt Name",
                          preFixIcon: Icons.person_outline,
                          textInputType: TextInputType.name,
                          mycontroller: signupCtrl.firstName,
                          myvalidator: (value) {
                            return validInput(value!, 20, 2, "Username");
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomSignupTf(
                          label: "",
                          hint: "Last Name",
                          preFixIcon: Icons.person_outline,
                          textInputType: TextInputType.name,
                          mycontroller: signupCtrl.lastName,
                          myvalidator: (value) {
                            return validInput(value!, 20, 2, "Username");
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  CustomSignupTf(
                    label: "Number",
                    hint: "Enter Your Number",
                    preFixIcon: Icons.phone_outlined,
                    textInputType: TextInputType.phone,
                    mycontroller: signupCtrl.phoneNumber,
                    myvalidator: (value) {
                      return validInput(value!, 15, 10, "Phone_Number");
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomSignupTf(
                    label: "Services",
                    hint: "Enter Your Services",
                    preFixIcon: Icons.cleaning_services_outlined,
                    textInputType: TextInputType.name,
                    mycontroller: signupCtrl.services,
                    myvalidator: (value) {
                      return validInput(value!, 30, 8, "Services");
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomSignupTf(
                    label: "Location",
                    hint: "Enter Your Location",
                    preFixIcon: Icons.location_on_outlined,
                    textInputType: TextInputType.name,
                    mycontroller: signupCtrl.location,
                    myvalidator: (value) {
                      return validInput(value!, 30, 4, "Location");
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomLoginButton(
                    ButtonText: "Sign Up",
                    onPress: () {
                      signupCtrl.signup();
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
