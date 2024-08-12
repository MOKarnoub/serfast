import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/auth/signupasprovider_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';

import '../../../core/enums/device_type.dart';
import '../../../core/ui_components/info_widget.dart';

class SignUpAsProvider extends GetView<SignupAsProviderCtrlImp> {
  const SignUpAsProvider({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignupAsProviderCtrlImp());
    return Container(
      color: const Color.fromRGBO(34, 44, 56, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Sgin Up As Provider"),
            centerTitle: true,
          ),
          body: InfoWidget(
            builder: (context, deviceInfo) => Container(
                width: double.infinity,
                height: 1000,
                padding: EdgeInsets.symmetric(
                  horizontal: deviceInfo.deviceType != OurDeviceType.mobile
                      ? deviceInfo.screenWidth * 0.15
                      : 8.0,
                ),
                child: GetBuilder<SignupAsProviderCtrlImp>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formstatekey,
                      child: ListView(
                        children: [
                          Image.asset(
                            "assets/images/logoserfast.png",
                            height: 200,
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.listOfService.length >= 3
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Services",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        const SizedBox(
                                          height: 40,
                                          width: 380,
                                          child: Text(
                                            "You Can Not Add More Than Three Services With The Same Account",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16),
                                            softWrap: true,
                                            maxLines: 3,
                                          ),
                                        )
                                      ],
                                    )
                                  : Text(
                                      "Services",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                              controller.listOfService.length < 3
                                  ? IconButton(
                                      onPressed: () {
                                        controller.addList();
                                      },
                                      icon: const Icon(Icons.add))
                                  : const Text("")
                            ],
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => Column(
                              children: [
                                for (int index = 0;
                                    index < controller.listOfService.length;
                                    index++) ...[
                                  Row(
                                    children: [
                                      Expanded(
                                          child: DropdownWidget1(index: index)),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Expanded(
                                          child: DropdownWidget2(index: index)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            controller.removeList(index);
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          CustomSignupTf(
                            label: "About",
                            hint: "Enter Some Info About Yourself",
                            preFixIcon: Icons.info_outline,
                            textInputType: TextInputType.text,
                            mycontroller: controller.about,
                            myvalidator: (value) {
                              return validInput(value!, 100, 10, "This Field");
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomLoginButton(
                            ButtonText: "Next",
                            onPress: () {
                              controller.gotoParttwo();
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          )),
    );
  }
}

class DropdownWidget1 extends StatelessWidget {
  const DropdownWidget1({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    SignupAsProviderCtrlImp controller = Get.find();
    return Obx(() {
      return Container(
        // height: 120,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 153, 255, 0.06),
            borderRadius: BorderRadius.circular(20)),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          isExpanded: true,
          // value: controller.selectedCategory.value.isEmpty
          value: controller.listOfService[index].category.value.isEmpty
              ? null
              : controller.listOfService[index].category.value,
          // : controller.selectedCategory.value,
          items: controller.categoriesList.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (String? newValue) {
            controller.listOfService[index].category.value = newValue!;
            controller.listOfService[index].service.value =
                ''; // Reset the second dropdown
          },
          dropdownColor: Colors.transparent,
          hint: const Text('Select Category'),
        ),
      );
    });
  }
}

class DropdownWidget2 extends StatelessWidget {
  const DropdownWidget2({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    SignupAsProviderCtrlImp controller = Get.find();
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 153, 255, 0.06),
            borderRadius: BorderRadius.circular(20)),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          isExpanded: true,
          value: controller.listOfService[index].service.value.isEmpty
              ? null
              : controller.listOfService[index].service.value,
          //controller.currentService.map((String item)
          items: controller
              .service[controller.listOfService[index].category.value]
              ?.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            controller.listOfService[index].service.value = newValue!;
          },
          dropdownColor: Colors.transparent,
          hint: const Text('Select'),
        ),
      );
    });
  }
}
