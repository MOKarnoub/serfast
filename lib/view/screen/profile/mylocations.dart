import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/my_locations_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class MyLocations extends StatelessWidget {
  const MyLocations({super.key});
  @override
  Widget build(BuildContext context) {
    final MyLocationsController locationsController =
        Get.put(MyLocationsController());
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: MyAppBar(title: "My Locations")),
          body: Padding(
              padding: const EdgeInsets.only(top: 14, left: 8.0, right: 8.0),
              child: Stack(
                children: [
                  GetBuilder<MyLocationsController>(
                    builder: (controller) => ListView.separated(
                        itemBuilder: (context, index) {
                          if (locationsController.myLocationsList.length ==
                              index) {
                            return const SizedBox(height: 20);
                          } else {
                            return LongPressDraggable<int>(
                              data: index,
                              childWhenDragging: Container(),
                              feedback: SizedBox(
                                width: MediaQuery.of(context).size.width - 50,
                                height: 50,
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: ListTile(
                                        title: Text(
                                          locationsController
                                              .myLocationsList[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 50,
                                height: 50,
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                                    child: ListTile(
                                      title: Text(
                                        locationsController
                                            .myLocationsList[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                // ),
                              ),
                              onDragStarted: () {
                                locationsController.allowTrash.value = true;
                              },
                              onDragEnd: (details) {
                                locationsController.allowTrash.value = false;
                              },
                              onDraggableCanceled: (velocity, offset) {
                                locationsController.allowTrash.value = false;
                              },
                            );
                          }
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: locationsController.myLocationsList.length),
                  ),
                  TrashFlow(controller: locationsController),
                ],
              )),
        ));
  }
}

class TrashFlow extends StatelessWidget {
  const TrashFlow({super.key, required this.controller});
  final MyLocationsController controller;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 40,
        left: 0,
        child: DragTarget<int>(
          builder: (context, _, __) {
            return Obx(() => Column(
                  children: [
                    if (controller.allowTrash.value) ...[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  width: 50,
                                  height: 50,
                                  child: const Icon(Icons.restore_from_trash)),
                            ]),
                      ),
                    ]
                  ],
                ));
          },
          onAcceptWithDetails: (details) {
            String element = controller.removeFromMyLocationsList(details.data);
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
              width: 280,
              buttonsBorderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
              dismissOnTouchOutside: true,
              dismissOnBackKeyPress: true,
              onDismissCallback: (type) {
                switchSnackBar(
                    type, context, details.data, controller, element);
              },
              headerAnimationLoop: false,
              animType: AnimType.bottomSlide,
              title: " ",
              desc: 'هل تريد حذف هذا الموقع',
              showCloseIcon: true,
              btnCancelOnPress: () {
                controller.addToMyLocationsList(element, details.data);
              },
              btnOkOnPress: () {},
            ).show();
          },
        ));
  }
}

void switchSnackBar(DismissType type, BuildContext context, int index,
    MyLocationsController controller, String element) {
  switch (type) {
    case DismissType.btnCancel:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black12,
          content: Text(
            'تم الإلغاء',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      controller.addToMyLocationsList(element, index);
      break;
    case DismissType.btnOk:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black12,
          content: Text(
            'تم الحذف',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      break;
    case DismissType.topIcon:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black12,
          content: Text(
            'تم الإلغاء',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      controller.addToMyLocationsList(element, index);
      break;
    case DismissType.androidBackButton:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black12,
          content: Text(
            'تم الإلغاء',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      controller.addToMyLocationsList(element, index);
      break;
    case DismissType.modalBarrier:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black12,
          content: Text(
            'تم الإلغاء',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      controller.addToMyLocationsList(element, index);
      break;
    case DismissType.other:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black12,
          content: Text(
            'تم الإلغاء',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      controller.addToMyLocationsList(element, index);
      break;
    default:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black12,
          content: Text(
            'تم الإلغاء',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
      controller.addToMyLocationsList(element, index);
  }
}
