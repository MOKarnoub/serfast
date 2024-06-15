import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/signup_controller.dart';
import 'package:serfast0_1/core/functions/alertexitapp.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_text.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';

class SignUp extends GetView<Signupctrlimp> {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<Signupctrlimp>(
            builder: (signupCtrl) => Container(
                  color: const Color.fromRGBO(34, 44, 56, 1),
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        title: const Text("Sgin Up"),
                        centerTitle: true,
                      ),
                      body: Container(
                        width: 1000,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: CustomSignupTf(
                                      label: "Name",
                                      hint: "Fisrt Name",
                                      preFixIcon: Icons.person_outline,
                                      textInputType: TextInputType.name,
                                      mycontroller: signupCtrl.firstName,
                                      myvalidator: (value) {
                                        return validInput(
                                            value!, 20, 2, "Username");
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomSignupTf(
                                      label: "",
                                      hint: "Last Name",
                                      preFixIcon: Icons.person_outline,
                                      textInputType: TextInputType.name,
                                      mycontroller: signupCtrl.lastName,
                                      myvalidator: (value) {
                                        return validInput(
                                            value!, 20, 2, "Username");
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 50),
                              CustomSignupTf(
                                label: "Email",
                                hint: "Enter Your Email",
                                preFixIcon: Icons.email_outlined,
                                textInputType: TextInputType.emailAddress,
                                mycontroller: signupCtrl.email,
                                myvalidator: (value) {
                                  return validInput(value!, 30, 10, "Email");
                                },
                              ),
                              const SizedBox(height: 50),
                              CustomSignupTf(
                                label: "Number",
                                hint: "Enter Your Number",
                                preFixIcon: Icons.phone_outlined,
                                textInputType: TextInputType.phone,
                                mycontroller: signupCtrl.phoneNumber,
                                myvalidator: (value) {
                                  return validInput(
                                      value!, 15, 10, "Phone_Number");
                                },
                              ),
                              const SizedBox(height: 50),
                              CustomSignupTf(
                                label: "Password",
                                hint: "Enter Your Password",
                                preFixIcon: Icons.lock_outline,
                                textInputType: TextInputType.visiblePassword,
                                mycontroller: signupCtrl.password,
                                myvalidator: (value) {
                                  return validInput(value!, 20, 8, "Password");
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
                              const SizedBox(height: 20),
                              CustomLoginButton(
                                ButtonText: "Sign Up",
                                onPress: () {
                                  signupCtrl.signup();
                                },
                              ),
                              CustomSignupText(
                                ONtap: () {
                                  signupCtrl.gotoLoginwithnumber();
                                },
                                Login_or_Signup: "Login",
                                question: "Already have an account?",
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      )),
                )));
  }
}
