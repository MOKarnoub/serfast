import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        title: const Text("Password"),
        centerTitle: true,
        ),
      body :Container(
        width: 1000,
        height: 1000,
        padding: const EdgeInsets.only(left:10,right: 10),
        color: Colors.transparent,
        child: Form(
          child: ListView(
            children: [
              // Image.asset("assets/images/logoserfast.png",
              //   height:200 ,),
                Center(child: Lottie.asset("assets/lottie/done.json",)),
            ],
          ),
        ),
      )
      ),
    );
  }
}