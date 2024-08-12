import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:serfast0_1/controller/auth/signupasproviderparttwo_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/core/enums/device_type.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class SignUpAsProviderPartTwo extends StatelessWidget {
  const SignUpAsProviderPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    SignupasproviderparttwoController addAddressController =
        Get.put(SignupasproviderparttwoController());
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
                    child: GetBuilder<SignupasproviderparttwoController>(
                      builder: (ctrl) => HandlingDataView(
                        statusRequest: ctrl.statusRequest,
                        widget: Column(
                          children: [
                            if (ctrl.kGooglePlex != null)
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GoogleMap(
                                      mapType: MapType.normal,
                                      markers: ctrl.markers.toSet(),
                                      onTap: (latlan) {
                                        ctrl.addMarkers(latlan);
                                      },
                                      initialCameraPosition:
                                          addAddressController.kGooglePlex!,
                                      onMapCreated: (GoogleMapController gmc) {
                                        addAddressController
                                            .completercontroller!
                                            .complete(gmc);
                                      },
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        height: 50,
                                        width: 280,
                                        child: CustomLoginButton(
                                            onPress: () {
                                              ctrl.signup();
                                            },
                                            ButtonText: "Sign Up"))
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    )))));
  }
}
