import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/home_controller.dart';
import 'package:serfast0_1/view/screen/bottomnavbarscreens/requests.dart';
import 'package:serfast0_1/view/screen/bottomnavbarscreens/support_screen.dart';
import 'package:serfast0_1/view/widget/drawer/my_drawer.dart';
import 'package:serfast0_1/view/widget/bottom_navigation_bar.dart';
import 'package:serfast0_1/view/widget/home/homepage.dart';
import 'package:serfast0_1/view/widget/home/homescreen_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeControllerimp homeControllerimp = Get.put(HomeControllerimp());
    final navBarController = Get.put(MyBottomNavigationBarController());
    final pages = [
      HomePage(controller: homeControllerimp), //Home Page
      const Requests(), // Requests
      const SupportScreen() // Support
    ];
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0x163978FF),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomHomeAppBar(),
        ),
        endDrawer: const MyDrawer(),
        body: PageView(
          controller: navBarController.pageController,
          onPageChanged: onPageChanged,
          children: pages,
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }

  void onPageChanged(value) {
    final navBarController = Get.put(MyBottomNavigationBarController());
    if (!navBarController.onTapClick.value)
    /* I have set this because when the navBarController.selectedIndex
              // listener is triggered and changes the value, the onPageChanged
              // callback is also triggered, causing a conflict. That's why I disabled
              // this function when onTap is called, and then re-enabled it
               for swipe gestures instead of tapping the BottomNavigationBar button.*/
    {
      navBarController.selectedIndex.value = value;
      navBarController.changeStyle.value = value;
    }
    navBarController.onTapClick.value = false;
  }
}
