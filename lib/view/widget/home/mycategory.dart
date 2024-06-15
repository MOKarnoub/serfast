import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/home_controller.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/data/model/categries.dart';

class MyCategory extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final HomeControllerimp controller;
  final int index;

  const MyCategory({
    super.key,
    required this.controller,
    required this.index,
    required this.categoriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.categoryServiceScreen, arguments: [index]);
          print("++++++++++++++++++++++++++++$index");
        },
        child: Listener(
            onPointerHover: (PointerHoverEvent details) {
              controller.opacityForText[index - 1].value = false;
            },
            onPointerUp: (pointerUpEvent) {
              Future.delayed(const Duration(milliseconds: 200), () {
                controller.opacityForText[index - 1].value = true;
              });
            },
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                transform: controller.opacityForText[index - 1].value
                    ? (Matrix4.identity()..setEntry(3, 2, 0.001))
                    : (Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..scale(1.1, 1.1)
                      ..rotateX(0.1)
                      ..rotateY(0.1)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(
                        categoriesModel.categoriesImageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ]),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Obx(
                        () => AnimatedOpacity(
                          opacity: controller.opacityForText[index - 1].value
                              ? 1.0
                              : 0.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Text(
                            categoriesModel.categoriesName!,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
