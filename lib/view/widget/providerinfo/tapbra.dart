import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:serfast0_1/controller/providerinfo_controller.dart';

class TapBar extends StatelessWidget {
  final ProviderInfoController myController;
  const TapBar({super.key, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          selectedFontSize: 20,
          backgroundColor: Colors.transparent,
          currentIndex: myController.selectedIndex.value,
          onTap: (index) {
            myController.updateSelectedIndex(index);
            myController.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          },
          selectedItemColor:
              Theme.of(context).primaryColorLight.withOpacity(0.87),
          items: [
            BottomNavigationBarItem(
              icon: Container(),
              label: "حول",
            ),
            BottomNavigationBarItem(icon: Container(), label: "مراجعات"),
            BottomNavigationBarItem(icon: Container(), label: "خدمات"),
          ],
        ));
  }
}
