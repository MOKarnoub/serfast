import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/googlemaps/viewaddress_controller.dart';
import 'package:serfast0_1/core/class/handelingdataview.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/enums/device_type.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/data/model/locationviewmodel.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class ViewLocation extends StatelessWidget {
  const ViewLocation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: MyAppBar(title: "My Locations")),
            floatingActionButton: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(0, 153, 255, 1),
                      Color.fromRGBO(0, 204, 153, 1),
                      Color.fromRGBO(0, 211, 88, 1),
                    ]),
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  Get.toNamed(AppRoute.addlocation);
                },
                child: const Icon(
                  Icons.add,
                  // color: Colors.red,
                  color: Color.fromRGBO(16, 29, 44, 1.0),
                ),
              ),
            ),
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
                      child: GetBuilder<ViewAddressController>(
                        builder: (controller) => HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: Container(
                              child: ListView.builder(
                                  itemCount: controller.locations.length,
                                  itemBuilder: (context, index) => LocationCard(
                                        ctrl: controller,
                                        locationid:
                                            controller.locations[index].locId!,
                                        locationViewModel:
                                            controller.locations[index],
                                      )),
                            )),
                      ),
                    ))));
  }
}

class LocationCard extends StatelessWidget {
  final LocationViewModel locationViewModel;
  final ViewAddressController ctrl;
  final int locationid;
  const LocationCard(
      {super.key,
      required this.locationViewModel,
      required this.ctrl,
      required this.locationid});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(2),
          child: ListTile(
            title: Text(
              locationViewModel.locationName!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    width: 400,
                    buttonsBorderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    dismissOnTouchOutside: true,
                    dismissOnBackKeyPress: true,
                    headerAnimationLoop: true,
                    animType: AnimType.scale,
                    title: "Warning",
                    desc: "Do You Really Want To Delete This Location?",
                    btnCancelText: "No",
                    btnCancelOnPress: () {},
                    btnOkText: "Yes",
                    btnOkOnPress: () {
                      ctrl.removeData(locationid);
                    },
                  ).show();
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                )),
          )),
    );
  }
}
