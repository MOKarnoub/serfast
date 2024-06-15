import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/home_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
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
              widget: CustomScrollView(
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
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 180,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                ],
              ),
            ));
  }
}
