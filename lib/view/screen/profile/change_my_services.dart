import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/change_my_services_controller.dart';
import 'package:serfast0_1/controller/edit_profile_controller.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class ChangeMyServices extends StatelessWidget {
  const ChangeMyServices({super.key});
  @override
  Widget build(BuildContext context) {
    final ChangeMyServicesController changeMyServicesController =
        Get.put(ChangeMyServicesController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: MyAppBar(
              title: "تعديل خدماتي",
              leading: IconButton(
                  onPressed: () {
                    // List.add()
                  },
                  icon: const Icon(Icons.add))),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          height: MediaQuery.of(context).size.height - 70,
          child: ListView.separated(
            itemBuilder: (context, index) {
              if (index == 1) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          changeMyServicesController.listOfMyServices[index][0],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          changeMyServicesController.listOfMyServices[index][1],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15),
                        ),
                      ]),
                );
              } else if (index ==
                  changeMyServicesController.listOfMyServices.length - 1) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          changeMyServicesController.listOfMyServices[index][0],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          changeMyServicesController.listOfMyServices[index][1],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15),
                        ),
                      ]),
                );
              } else {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          changeMyServicesController.listOfMyServices[index][0],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          changeMyServicesController.listOfMyServices[index][1],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15),
                        ),
                      ]),
                );
              }
            },
            itemCount: changeMyServicesController.listOfMyServices.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
          ),
        ),
      ),
    );
  }
}

Dialog _buildDialog(BuildContext context, EditProfileController controller) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    backgroundColor: Colors.black87,
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("المنطقة",
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.clear_rounded,
                    ),
                  ), // X Icon in title
                ),
              ],
            ), // row for title and X
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 200,
            child: ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    controller.setSelectedCategory(index);
                    Get.back();
                  },
                  title: Text(controller.categories[index]),
                  titleTextStyle: Theme.of(context).textTheme.labelMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ) // ListView for ListTile
        ],
      ),
    ),
  );
}

Dialog _buildDialog2(BuildContext context, EditProfileController controller) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    backgroundColor: Colors.black87,
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("العمل",
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.clear_rounded,
                    ),
                  ), // X Icon in title
                ),
              ],
            ), // row for title and X
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 200,
            child: ListView.builder(
              itemCount:
                  controller.whichList[controller.selectedCategory!].length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    controller.setSelectedList(index);
                    Get.back();
                  },
                  title: Text(controller.whichList[controller.selectedCategory!]
                      [index]),
                  titleTextStyle: Theme.of(context).textTheme.labelMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ) // ListView for ListTile
        ],
      ),
    ),
  );
}
