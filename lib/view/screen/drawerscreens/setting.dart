import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/setting_controller.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MyAppBar(title: "Setting"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          controller.changeIsShowingListLangutios();
                        },
                        icon: const Icon(Icons.arrow_forward_ios)),
                    title: const Text("Language"),
                  ),
                  GetBuilder<SettingController>(builder: (controller) {
                    if (controller.isShowingList) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.isDarkMode
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.grey.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              trailing: Container(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        "assets/images/syria.jpg",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(50),
                                  // border:
                                ),
                              ),
                              title: const Text("العربية"),
                              onTap: () {},
                            ),
                            const Divider(),
                            ListTile(
                              trailing: Container(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        "assets/images/syria.jpg",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(50),
                                  // border:
                                ),
                              ),
                              title: const Text("English"),
                              onTap: () {},
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  }),
                ],
              ),
              Obx(
                () => ListTile(
                  trailing: Switch(
                      value: controller.mode.value,
                      onChanged: (value) {
                        controller.mode.value = value;
                        Get.changeThemeMode(
                            value ? ThemeMode.light : ThemeMode.dark);
                      }),
                  title: const Text(
                    "Theme Mode",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
