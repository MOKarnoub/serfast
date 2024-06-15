import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/providerinfo_controller.dart';
import 'package:serfast0_1/data/model/provider.dart';
import 'package:serfast0_1/view/widget/providerinfo/aboutprovider.dart';

class AboutScreen extends StatelessWidget {
  final int? catID;
  final int? serviceID;
  final int? providerID;
  const AboutScreen({
    super.key,
    required this.catID,
    required this.serviceID,
    required this.providerID,
  });
  @override
  Widget build(BuildContext context) {
    final ProviderInfoController providerInfoController = Get.put(
        ProviderInfoController(
            catID: catID!, serviceID: serviceID!, providerID: providerID!));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AboutProvider(
              providerModel: ProviderModel.fromJson(
                  providerInfoController.listOfProviders[0])),
        ),
      ),
    );
  }
}
