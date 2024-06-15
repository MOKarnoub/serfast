import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/providerinfo_controller.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key, required this.controller});
  final ProviderInfoController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: controller.servicesList.length,
                  (context, index) {
                    controller.opacityForText.add(true.obs);
                    return GestureDetector(
                      onTap: () {},
                      child: Listener(
                          onPointerHover: (PointerHoverEvent details) {
                            controller.opacityForText[index].value = false;
                          },
                          onPointerUp: (pointerUpEvent) {
                            Future.delayed(const Duration(milliseconds: 200),
                                () {
                              controller.opacityForText[index].value = true;
                            });
                          },
                          child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001), // تأثير العمق
                            // ..rotateX(0.1) // تدوير على المحور الأفقي
                            // ..rotateY(0.1), //
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // image: DecorationImage(
                                  //   image: AssetImage(
                                  //     controller.servicesList[index].imageUrl,
                                  //   ),
                                  //   fit: BoxFit.cover,
                                  // ),
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Obx(
                                        () => AnimatedOpacity(
                                          opacity: controller
                                                  .opacityForText[index].value
                                              ? 1.0
                                              : 0.0,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          child: Text(
                                            controller.servicesList[index]
                                                .serviceName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ],
          )),
    );
  }
}
