import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/changeuserinfo.dart';
import 'package:serfast0_1/controller/edit_profile_controller.dart';
import 'package:serfast0_1/controller/profile_controller.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/editprofile/personalphoto.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';
import 'package:serfast0_1/view/widget/profile_settings_icon.dart';

import '../../../core/enums/device_type.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ChangeUserInfoController());
    Get.put(EditProfileController());
    final profileController = Get.put(ProfileController());
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: MyAppBar(
              title: "Edit Profile",
              leading: IconButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoute.profileScreen);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded))),
        ), // appBar
        body: InfoWidget(
          builder: (context, deviceInfo) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: deviceInfo.deviceType != OurDeviceType.mobile
                  ? deviceInfo.screenWidth * 0.15
                  : 8.0,
            ),
            child: ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: PersonlaPhoto(controller: profileController)),
                const SizedBox(height: 20),
                Text(
                  "Account settings",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                ProfileSettingsIcon(
                  icon: Icons.shield_outlined,
                  title: "Password and security",
                  onTap: () {
                    Get.toNamed(AppRoute.changePassword);
                  },
                ),
                const SizedBox(height: 20),
                ProfileSettingsIcon(
                  icon: Icons.contacts_outlined,
                  title: "Personal details",
                  onTap: () {
                    Get.toNamed(AppRoute.personalInfo);
                  },
                ),
                const SizedBox(height: 20),
                ProfileSettingsIcon(
                  icon: Icons.email_outlined,
                  title: "Contact info",
                  onTap: () {
                    Get.toNamed(AppRoute.contactInfo);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Dialog _buildDialog3(BuildContext context, EditProfileController controller) {
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
              itemCount: controller.myListOfLocationsAsProvider.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    controller.setSelectedLocation(index);
                    Get.back();
                  },
                  title: Text(controller.myListOfLocationsAsProvider[index]),
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

// Row(
//   children: [
//     Expanded(
//       child: TextField(
//         decoration: InputDecoration(
//           border: const OutlineInputBorder(),
//           labelText: 'Name',
//           labelStyle: Theme.of(context).textTheme.bodyMedium,
//         ),
//       ),
//     ),
//     const SizedBox(
//       width: 20,
//     ),
//     Expanded(
//       child: GestureDetector(
//         onTap: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return _buildDialog3(context, editProfileController);
//             },
//           );
//         },
//         child: AbsorbPointer(
//           absorbing: true,
//           child: GetBuilder<EditProfileController>(
//             builder: (controller) => TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(3),
//                   borderSide: const BorderSide(
//                     style: BorderStyle.solid,
//                     color: Colors.white,
//                     width: 5,
//                   ),
//                 ),
//                 hintText: editProfileController.myListOfLocationsAsProvider[
//                     editProfileController.selectedLocation!],
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.arrow_drop_down),
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
