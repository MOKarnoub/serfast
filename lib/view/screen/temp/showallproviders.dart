import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/showallproviders_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/data/model/provider.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';
import 'package:serfast0_1/view/widget/showall_providercard.dart';

class ShowAllProviders extends StatelessWidget {
  const ShowAllProviders({super.key});
  @override
  Widget build(BuildContext context) {
    final int categoryID = Get.arguments[0];
    final int serviceID = Get.arguments[1];
    Get.put(
        ShowAllProvidersController(catID: categoryID, serviceID: serviceID));
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: MyAppBar(title: "All Providers"),
            ),
            body: GetBuilder<ShowAllProvidersController>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, left: 8.0),
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: controller.listOfProviders.length,
                            itemBuilder: (context, index) =>
                                ShowAllProvidersCard(
                                  providerModel: ProviderModel.fromJson(
                                      controller.listOfProviders[index]),
                                  onPressedIcon: () {},
                                )),
                      ),
                    ))));
  }
}
