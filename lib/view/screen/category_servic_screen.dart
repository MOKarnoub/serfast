import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/categoryservices_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/enums/device_type.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/data/model/categoryservices.dart';
import 'package:serfast0_1/view/widget/categoriesservices/topsection.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';
import 'package:serfast0_1/view/widget/categoriesservices/myservices.dart';
import 'package:serfast0_1/view/widget/categoriesservices/providers_listview.dart';

class CategoryServiceScreen extends StatelessWidget {
  const CategoryServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppServices myAppServices = Get.find();
    final int categoryID = Get.arguments[0];
    Get.put(CategoryServicesController(catID: categoryID));
    return Directionality(
        textDirection: TextDirection.ltr,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return Scaffold(
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(55),
                  child: MyAppBar(title: "Services"),
                ),
                body: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 8.0,
                            right: deviceInfo.deviceType != OurDeviceType.mobile
                                ? deviceInfo.screenWidth * 0.1
                                : 8.0,
                            left: deviceInfo.deviceType != OurDeviceType.mobile
                                ? deviceInfo.screenWidth * 0.1
                                : 8.0,
                            bottom: 20),
                        child: Column(children: [
                          Padding(
                            padding: deviceInfo.deviceType !=
                                    OurDeviceType.mobile
                                ? EdgeInsets.symmetric(
                                    horizontal: deviceInfo.screenWidth * 0.15)
                                : const EdgeInsets.symmetric(horizontal: 0),
                            child: TopSection(
                                userName: myAppServices.sharedPreferences
                                    .getString("userfname")!),
                          ),
                          Expanded(
                              child: GetBuilder<CategoryServicesController>(
                                  builder: (controller) => HandlingDataView(
                                      statusRequest: controller.statusRequest,
                                      widget: ListView.separated(
                                          itemCount: controller.data.length,
                                          separatorBuilder: (context, index1) =>
                                              const SizedBox(height: 5),
                                          itemBuilder: (context, index1) =>
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: Column(children: [
                                                    MyServices(
                                                        categoryServicesModel:
                                                            CategoryServicesModel
                                                                .fromJson(
                                                                    controller
                                                                            .data[
                                                                        index1]),
                                                        onPressedShowAll: () =>
                                                            Get.toNamed(
                                                                AppRoute
                                                                    .showAllProviders,
                                                                arguments: [
                                                                  categoryID,
                                                                  index1
                                                                ])),
                                                    ProvidersListView(
                                                      categoryServicesModel:
                                                          CategoryServicesModel
                                                              .fromJson(
                                                                  controller
                                                                          .data[
                                                                      index1]),
                                                      catID: categoryID,
                                                      serviceID: index1,
                                                    )
                                                  ]))))))
                        ]))));
          },
        ));
  }
}
