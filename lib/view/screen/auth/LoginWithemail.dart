import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/loginwithemail_controller.dart';
import 'package:serfast0_1/controller/auth/loginwithnumber_controller.dart';
import 'package:serfast0_1/controller/auth/signup_controller.dart';
import 'package:serfast0_1/core/functions/alertexitapp.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_password_tf.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_text.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';
import 'package:serfast0_1/view/widget/auth/custom_signupwith_icon.dart';

class LoginWithemail extends StatelessWidget {
  const LoginWithemail({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginWithemailctrlimp>(
            builder: (loginWithEmailCtrl) => Container(
                  color: const Color.fromRGBO(34, 44, 56, 1),
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        toolbarHeight: 70,
                        backgroundColor: Colors.transparent,
                        title: const Text("Login With Number"),
                        centerTitle: true,
                      ),
                      body: Container(
                        width: 1000,
                        height: 1000,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        color: Colors.transparent,
                        child: Form(
                          key: loginWithEmailCtrl.formstatekey,
                          child: ListView(
                            children: [
                              Image.asset(
                                "assets/images/logoserfast.png",
                                height: 200,
                              ),
                              const SizedBox(height: 20),
                              CustomSignupTf(
                                label: "Email",
                                hint: "Enter Your Email",
                                preFixIcon: Icons.email_outlined,
                                textInputType: TextInputType.emailAddress,
                                mycontroller: loginWithEmailCtrl.email,
                                myvalidator: (value) {
                                  return validInput(value!, 30, 10, "Email");
                                },
                              ),
                              const SizedBox(height: 50),
                              CustomSignupPasswordTf(
                                label: "Password",
                                hint: "Enter Your Password",
                                countertext: "Forget Password?",
                                preFixIcon: Icons.lock_outline,
                                sufFixIcon: Icons.remove_red_eye_outlined,
                                textInputType: TextInputType.visiblePassword,
                                isobscure: loginWithEmailCtrl.isShowPass,
                                mycontroller: loginWithEmailCtrl.password,
                                myvalidator: (value) {
                                  return validInput(value!, 20, 8, "Password");
                                },
                                onTapForget: () {
                                  loginWithEmailCtrl.gotoForgetpassword();
                                },
                                onTapIcon: () {
                                  loginWithEmailCtrl.showPassword();
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomLoginButton(
                                ButtonText: "Login",
                                onPress: () {
                                  loginWithEmailCtrl.login();
                                },
                              ),
                              CustomSignupText(
                                ONtap: () {
                                  Get.put(LoginWithnumberctrlimp());
                                  loginWithEmailCtrl.gotoLoginwithnumber();
                                },
                                Login_or_Signup: " Login with number",
                                question: "",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "____________________",
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white60,
                                      ),
                                      alignment: Alignment.center,
                                      width: 62,
                                      height: 30,
                                      child: const Text(
                                        "O R",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(34, 44, 56, 1),
                                            fontSize: 20,
                                            wordSpacing: -7,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "____________________",
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomSignupwithIcon(icon: Icons.android),
                                  CustomSignupwithIcon(icon: Icons.apple),
                                  CustomSignupwithIcon(icon: Icons.facebook),
                                ],
                              ),
                              CustomSignupText(
                                ONtap: () {
                                  Get.put(Signupctrlimp());
                                  loginWithEmailCtrl.gotosignup();
                                },
                                Login_or_Signup: "Sign up",
                                question: "Don't have an account?",
                              ),
                            ],
                          ),
                        ),
                      )),
                )));
  }
}
