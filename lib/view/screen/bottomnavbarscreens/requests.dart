import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/home_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/core/enums/device_type.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/custom_requst_providercard.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              right: deviceInfo.deviceType != OurDeviceType.mobile
                  ? deviceInfo.screenWidth * 0.15
                  : 8.0,
              left: deviceInfo.deviceType != OurDeviceType.mobile
                  ? deviceInfo.screenWidth * 0.15
                  : 8.0,
            ),
            child: GetBuilder<HomeControllerimp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.separated(
                  itemCount: controller.order.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0, bottom: 14),
                        width: MediaQuery.of(context).size.width - 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).colorScheme.surface,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 2,
                                offset: Offset(1, 2),
                                color: Colors.black26,
                              )
                            ]),
                        child: CustomProviderCard(
                          providerName:
                              "${controller.order[index].firstName!} ${controller.order[index].lastName!}",
                          providerImage: 'assets/images/AC.jpg',
                          providerRate: controller.order[index].rate!,
                          serviceDate: controller.order[index].serviceName!,
                          servicePrice: controller.order[index].price!,
                          status: controller.order[index].status!,
                        ));
                  },
                ),
              ),
            ));
      },
    );
  }
}
