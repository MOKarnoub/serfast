import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/order_controller.dart';
import 'package:serfast0_1/controller/providerinfo_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/data/model/provider.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';
import 'package:serfast0_1/view/widget/order/listofdays.dart';
import 'package:serfast0_1/view/widget/order/listofhours.dart';
import 'package:serfast0_1/view/widget/order/providercard.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final int catID = Get.arguments[0];
    final int serviceID = Get.arguments[1];
    final int providerID = Get.arguments[2];
    ///////////////sakjdhjksahdkjsahdjkhaskdjhsajkhkdhkd//////////////
    ///هي الصفحه منتاك اختا
    Get.put(ProviderInfoController(
        catID: catID, serviceID: serviceID, providerID: providerID));
    final orderController = Get.put(OrderController(
        providerID: providerID, catID: catID, serviceID: serviceID));

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(55),
              child: MyAppBar(
                title: "Order",
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              )),
          body: GetBuilder<ProviderInfoController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.listOfProviders.length,
                  itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: ProviderCard(
                                providerModel: ProviderModel.fromJson(
                                    controller.listOfProviders[index]),
                                onTap: () {
                                  Get.toNamed(AppRoute.providerInfo,
                                      arguments: [
                                        catID,
                                        serviceID,
                                        providerID
                                      ]);
                                },
                                onPressed: () {
                                  Get.toNamed(AppRoute.providerInfo,
                                      arguments: [
                                        catID,
                                        serviceID,
                                        providerID
                                      ]);
                                }),
                          ),
                          const SizedBox(height: 50),
                          GetBuilder<OrderController>(
                            builder: (orderController) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "متى تريد الخدمة؟",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                if (orderController.showHisDate) ...[
                                  ElevatedButton(
                                      onPressed: () {
                                        orderController
                                            .updateShowHisDate(false);
                                      },
                                      child: Text(
                                        "تغير",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )),
                                  const SizedBox(height: 10),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListOfDate(
                            controller: orderController,
                            // providerInfoController: providerInfoController,
                          ),
                          const SizedBox(height: 10),
                          const Divider(height: 50),
                          Text(
                            "في اي ساعة؟",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 10),
                          ListOfHours(
                            controller: orderController,
                          ),
                          const Divider(height: 50),
                          Text(
                            "ادخل موقعك:",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.white.withOpacity(0.75)),
                          ),
                          const SizedBox(height: 20),
                          LocationField(controller: orderController),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 270, top: 10),
                            child: CustomLoginButton(
                              ButtonText: "Next",
                              onPress: () {
                                orderController.sendOrder();
                              },
                            ),
                          )
                        ],
                      )),
            ),
          ),
        ));
  }
}

class LocationField extends StatelessWidget {
  const LocationField({super.key, required this.controller});

  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) => InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => buildShowDialog(context, controller),
          );
        },
        child: buildStaticLocationField(controller, context),
      ),
    );
  }

  AbsorbPointer buildStaticLocationField(
      OrderController controller, BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.white,
              width: 5,
            ),
          ),
          hintText:
              controller.locations[controller.selectedLocation!].locationName,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {},
          ),
        ),
        // ),
      ),
    );
  }

  Container buildShowDialog(BuildContext context, OrderController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.gps_fixed),
                    onPressed: () {},
                  ),
                ]),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: Theme.of(context).colorScheme.surface,
              child: ListView.separated(
                itemCount: controller.locations.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    controller.updateSelectedLocation(index);
                    Get.back();
                  },
                  title: Text(
                    controller.locations[index].locationName!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Container buildIconAdd(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Theme.of(context).colorScheme.surface),
//     child: const Center(
//       child: Icon(Icons.add, size: 31),
//     ),
//   );
// }
