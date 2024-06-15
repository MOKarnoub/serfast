import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/localization/changelocal.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  controller.changeLang("ar");
                },
                child: const Text("AR"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  controller.changeLang("en");
                },
                child: const Text("EN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
