import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/home_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/core/enums/device_type.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/data/model/categries.dart';
import 'package:serfast0_1/view/widget/home/mycategory.dart';
import 'package:serfast0_1/view/widget/home/upsection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.controller});

  final HomeControllerimp controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerimp>(
        builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: InfoWidget(
                builder: (context, deviceInfo) {
                  OurDeviceType deviceType = deviceInfo.deviceType;
                  return Container(
                    margin: deviceInfo.deviceType == OurDeviceType.desktop
                        ? EdgeInsets.symmetric(
                            horizontal: deviceInfo.screenWidth * 0.06)
                        : const EdgeInsets.symmetric(horizontal: 0),
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: UpSection(
                            sizeOfCurve: 200,
                          ),
                        ),
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              controller.opacityForText.add(true.obs);
                              return MyCategory(
                                categoriesModel: CategoriesModel.fromJson(
                                    controller.categoriesList[index]),
                                controller: controller,
                                index: controller.categoriesList[index]
                                    ['categories_id'],
                              );
                            },
                            childCount: controller.categoriesList.length,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                deviceType == OurDeviceType.mobile ? 2 : 3,
                            mainAxisExtent: deviceType == OurDeviceType.mobile
                                ? 180
                                : deviceType == OurDeviceType.tablet
                                    ? 250
                                    : 400,
                            crossAxisSpacing:
                                deviceType == OurDeviceType.desktop ? 20 : 10,
                            mainAxisSpacing:
                                deviceType == OurDeviceType.desktop ? 20 : 10,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ));
  }
}
