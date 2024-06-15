import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/data/model/provider.dart';
import 'package:serfast0_1/data/model/categoryservices.dart';
import 'package:serfast0_1/view/widget/categoriesservices/custom_providercard.dart';

class ProvidersListView extends StatelessWidget {
  final CategoryServicesModel categoryServicesModel;
  final int serviceID;
  final int catID;
  const ProvidersListView(
      {super.key,
      required this.categoryServicesModel,
      required this.serviceID,
      required this.catID});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemCount: categoryServicesModel.providerList!.length,
          itemBuilder: (context, index) {
            ProviderModel provider = categoryServicesModel.providerList![index];
            return CustomProvidercard(
              providerModel: provider,
              onPressedInfoIcon: () {
                Get.toNamed(AppRoute.providerInfo,
                    arguments: [catID, serviceID, index]);
              },
              onPressedProviderCard: () {
                Get.toNamed(AppRoute.orderScreen,
                    arguments: [catID, serviceID, index]);
              },
            );
          },
        ));
  }
}
