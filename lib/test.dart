// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:lottie/lottie.dart';
// import 'package:untitled4/core/functions/getcurrentlocation.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.amber,
//       // padding: EdgeInsets.only(top: 300),
//       alignment: Alignment.center,
//       child: MaterialButton(
//         onPressed: ()
//         {
//           determinePosition();
//           // Center(child: Lottie.asset("assets/lottie/loader.json",width: 250,height: 150 ));
          
//             // Color.fromRGBO(0,153,255, 1),
//             // Color.fromRGBO(0,204,153, 1),
//             // Color.fromRGBO(0,211,88, 1),
//           //  Get.defaultDialog(
//           //   middleText: '',
//           //   title: '',
//           //   backgroundColor: Color.fromARGB(1, 1, 1, 0),
//           //   actions: [ Center(child: Lottie.asset("assets/lottie/loader.json",width: 250,height: 150 ))]
//           //  );
//         },
//         child: Text("ks"),
//         color: Colors.red,
//         ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:untitled4/controller/changepassword_controller.dart';
// // import 'package:untitled4/controller/edit_profile_controller.dart';
// // import 'package:untitled4/controller/profile_controller.dart';
// // import 'package:untitled4/core/constant/route_names.dart';
// // import 'package:untitled4/view/widget/editprofile/bottomsection.dart';
// // import 'package:untitled4/view/widget/editprofile/midsection.dart';
// // import 'package:untitled4/view/widget/editprofile/personalphoto.dart';
// // import 'package:untitled4/view/widget/my_app_bar.dart';

// // class EditProfileScreen extends StatelessWidget {
// //   const EditProfileScreen({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     final  changePasswordController = Get.put(ChangePasswordController());
// //     final profileController = Get.put(ProfileController());
// //     final editProfileController = Get.put(EditProfileController());
// //     return Directionality(
// //       textDirection: TextDirection.ltr,
// //       child: Scaffold(
// //         appBar: PreferredSize(
// //           preferredSize: const Size.fromHeight(70),
// //           child: MyAppBar
// //           ( 
// //             title: "Edit Profile",
// //             leading: IconButton(onPressed: () 
// //             {
// //               Get.offAllNamed(AppRoute.profileScreen);
// //             }, 
// //             icon:const Icon(Icons.arrow_back_ios_new_rounded)
// //             )
// //           ),
// //         ), // appBar
// //         body: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: ListView(
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10 ),
// //                 child: PersonlaPhoto(controller: profileController)
// //               ),
// //               const SizedBox(height: 20),
// //               Text
// //               (
// //                 "Personal Information",
// //                 style: Theme.of(context).textTheme.bodyLarge,
// //               ),
// //               const SizedBox(height: 20),
// //               MidSection(changePasswordController: changePasswordController,),
// //               const SizedBox(height: 30),
// //               Divider(color: Theme.of(context).primaryColorLight.withOpacity(0.3)),
// //               const SizedBox(height: 20),
// //               BottomSection(controller: editProfileController,),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // Dialog _buildDialog3(BuildContext context, EditProfileController controller) {
// //   return Dialog(
// //     shape: RoundedRectangleBorder(
// //       borderRadius: BorderRadius.circular(15),
// //     ),
// //     backgroundColor: Colors.black87,
// //     child: Directionality(
// //       textDirection: TextDirection.rtl,
// //       child: Column(
// //         children: [
// //           Container(
// //             padding: const EdgeInsets.all(8.0),
// //             decoration: BoxDecoration(
// //               color: Theme.of(context).primaryColorLight.withOpacity(0.8),
// //               borderRadius: BorderRadius.circular(15),
// //             ),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   flex: 5,
// //                   child: Container(
// //                     padding: const EdgeInsets.only(right: 30),
// //                     child: Text("العمل",
// //                         style: Theme.of(context).textTheme.labelMedium,
// //                         textAlign: TextAlign.center),
// //                   ),
// //                 ),
// //                 Expanded(
// //                   flex: 1,
// //                   child: IconButton(
// //                     onPressed: () {
// //                       Get.back();
// //                     },
// //                     icon: const Icon(
// //                       Icons.clear_rounded,
// //                     ),
// //                   ), // X Icon in title
// //                 ),
// //               ],
// //             ), // row for title and X
// //           ),
// //           SizedBox(
// //             height: MediaQuery.sizeOf(context).height - 200,
// //             child: ListView.builder(
// //               itemCount: controller.myListOfLocationsAsProvider.length,
// //               itemBuilder: (context, index) => Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: ListTile(
// //                   onTap: () {
// //                     controller.setSelectedLocation(index);
// //                     Get.back();
// //                   },
// //                   title: Text(controller.myListOfLocationsAsProvider[index]),
// //                   titleTextStyle: Theme.of(context).textTheme.labelMedium,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(15),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ) // ListView for ListTile
// //         ],
// //       ),
// //     ),
// //   );
// // }

//                   // Row(
//                   //   children: [
//                   //     Expanded(
//                   //       child: TextField(
//                   //         decoration: InputDecoration(
//                   //           border: const OutlineInputBorder(),
//                   //           labelText: 'Name',
//                   //           labelStyle: Theme.of(context).textTheme.bodyMedium,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     const SizedBox(
//                   //       width: 20,
//                   //     ),
//                   //     Expanded(
//                   //       child: GestureDetector(
//                   //         onTap: () {
//                   //           showDialog(
//                   //             context: context,
//                   //             builder: (context) {
//                   //               return _buildDialog3(context, editProfileController);
//                   //             },
//                   //           );
//                   //         },
//                   //         child: AbsorbPointer(
//                   //           absorbing: true,
//                   //           child: GetBuilder<EditProfileController>(
//                   //             builder: (controller) => TextFormField(
//                   //               decoration: InputDecoration(
//                   //                 border: OutlineInputBorder(
//                   //                   borderRadius: BorderRadius.circular(3),
//                   //                   borderSide: const BorderSide(
//                   //                     style: BorderStyle.solid,
//                   //                     color: Colors.white,
//                   //                     width: 5,
//                   //                   ),
//                   //                 ),
//                   //                 hintText: editProfileController.myListOfLocationsAsProvider[
//                   //                     editProfileController.selectedLocation!],
//                   //                 suffixIcon: IconButton(
//                   //                   icon: const Icon(Icons.arrow_drop_down),
//                   //                   onPressed: () {},
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),