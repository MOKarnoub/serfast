import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/googlemaps/addaddressparttwo_contorller.dart';
import 'package:serfast0_1/core/enums/device_type.dart';
import 'package:serfast0_1/core/functions/validator.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/auth/custom_signup_tf.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class AddLocationPartTwo extends StatelessWidget {
  const AddLocationPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressParttowController addAddressController =
        Get.put(AddAddressParttowController());
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: MyAppBar(title: "Add Locations")),
            body: InfoWidget(
                builder: (context, deviceInfo) => Padding(
                    padding: EdgeInsets.only(
                      top: 14,
                      right: deviceInfo.deviceType != OurDeviceType.mobile
                          ? deviceInfo.screenWidth * 0.15
                          : 8.0,
                      left: deviceInfo.deviceType != OurDeviceType.mobile
                          ? deviceInfo.screenWidth * 0.15
                          : 8.0,
                    ),
                    child: Container(
                      width: 1000,
                      height: 1000,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      color: Colors.transparent,
                      child: Form(
                        key: addAddressController.fs1,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            CustomSignupTf(
                              label: "Location Name",
                              hint: "Enter Your Location Name",
                              preFixIcon: Icons.location_on_outlined,
                              textInputType: TextInputType.text,
                              mycontroller: addAddressController.locationName,
                              myvalidator: (value) {
                                return validInput(value!, 30, 0, "This Field");
                              },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomSignupTf(
                              label: "Buliding Number",
                              hint: "Enter Your Buliding Number",
                              preFixIcon: Icons.location_on_outlined,
                              textInputType: TextInputType.number,
                              mycontroller: addAddressController.buildingNumber,
                              myvalidator: (value) {
                                return validInput(value!, 30, 0, "This Field");
                              },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomSignupTf(
                              label: "Notes",
                              hint: "Enter Your Notes",
                              preFixIcon: Icons.note_add_outlined,
                              textInputType: TextInputType.text,
                              mycontroller: addAddressController.notes,
                              myvalidator: (value) {
                                return validInput(value!, 200, 0, "This Field");
                              },
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              height: 50,
                              width: 20,
                              child: CustomLoginButton(
                                  onPress: () {
                                    addAddressController.addLocation();
                                  },
                                  ButtonText: "Add Location"),
                            )
                          ],
                        ),
                      ),
                    )))));
  }
}
