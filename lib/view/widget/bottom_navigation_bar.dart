import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyBottomNavigationBarController());
    return Obx(
      () =>  Container(
        decoration:BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Theme.of(context).colorScheme.secondary.withOpacity(0.65),
                Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
                Theme.of(context).colorScheme.surface.withOpacity(0.6),
            ]),),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Theme.of(context).colorScheme.onSecondary,
          buttonBackgroundColor: const Color.fromRGBO(0,150,153, 0.6),
          letIndexChange: (value) => true,
          height: 55,
          items: items(controller),
          index: controller.selectedIndex.value,
          onTap: (index) => onTap(index,controller),
          animationCurve: Easing.linear,
          animationDuration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }

  List<Widget> items(MyBottomNavigationBarController controller) {
    return [
        Obx(
              () => Icon(
              controller.changeStyle.value == 0
                  ? Icons.home_outlined
                  : Icons.home,
              size: controller.changeStyle.value == 0 ? 30 : 20),
        ),
        Obx(
          () => Icon(
              controller.changeStyle.value == 1
                  ? Icons.receipt_long_outlined
                  : Icons.receipt_long,
              size: controller.changeStyle.value == 1 ? 30 : 20),
        ),
        Obx(
              () => Icon(
              controller.changeStyle.value == 2
                  ? Icons.support_agent_outlined
                  : Icons.support_agent,
              size: controller.changeStyle.value == 2 ? 30 : 20),
        ),
      ];
  }
  void onTap(int index,MyBottomNavigationBarController controller) async {
  controller.onTapClick.value = true;
  controller.selectedIndex.value = index;
  await Future.delayed(const Duration(milliseconds: 150));
  controller.changeStyle.value = index;
}
}
class MyBottomNavigationBarController extends GetxController {
  final PageController pageController = PageController();
  final RxInt selectedIndex = 0.obs;
  final RxInt changeStyle = 0.obs;
  final RxBool onTapClick = false.obs;
  @override
  void onInit() {
    super.onInit();
    selectedIndex.listen((index) {
      pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn
      );
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

