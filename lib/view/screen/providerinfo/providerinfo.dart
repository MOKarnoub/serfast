import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/providerinfo_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/data/model/provider.dart';
import 'package:serfast0_1/view/screen/providerinfo/about_screen.dart';
import 'package:serfast0_1/view/screen/providerinfo/reviews_screen.dart';
import 'package:serfast0_1/view/screen/providerinfo/service_screen.dart';
import 'package:serfast0_1/view/widget/providerinfo/appbar.dart';
import 'package:serfast0_1/view/widget/providerinfo/name_and_rate.dart';
import 'package:serfast0_1/view/widget/providerinfo/tapbra.dart';
import 'package:serfast0_1/view/widget/providerinfo/topsection.dart';

class ProviderInfo extends StatelessWidget {
  const ProviderInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final int catID = Get.arguments[0];
    final int serviceID = Get.arguments[1];
    final int providerID = Get.arguments[2];
    final providerInfoController = Get.put(ProviderInfoController(
        catID: catID, serviceID: serviceID, providerID: providerID));

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: GetBuilder<ProviderInfoController>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        children: [
                          SizedBox(
                              height: 324,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.listOfProviders.length,
                                itemBuilder: (context, index) => Stack(
                                  children: [
                                    ImageUp(
                                        providerModel: ProviderModel.fromJson(
                                            controller.listOfProviders[index])),
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.375,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                      child: SafeArea(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const MyLocalAppBar(),
                                            Column(
                                              children: [
                                                NameAndRateIcon(
                                                  providerModel: ProviderModel
                                                      .fromJson(controller
                                                              .listOfProviders[
                                                          index]),
                                                ),
                                                const SizedBox(height: 12),
                                                TapBar(
                                                    myController:
                                                        providerInfoController)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            child: PageView(
                              controller: providerInfoController.pageController,
                              onPageChanged: (index) {
                                providerInfoController
                                    .updateSelectedIndex(index);
                              },
                              children: [
                                AboutScreen(
                                  catID: catID,
                                  serviceID: serviceID,
                                  providerID: providerID,
                                ),
                                const ReviewsScreen(),
                                ServicesScreen(
                                    controller: providerInfoController),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))));
  }
}
