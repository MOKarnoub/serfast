import 'package:flutter/material.dart';
import 'package:serfast0_1/controller/profile_controller.dart';
import 'package:serfast0_1/view/widget/profile_settings_icon.dart';

class PersonlaPhoto extends StatelessWidget {
  final ProfileController controller;
  const PersonlaPhoto({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(110), color: Colors.grey),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey),
                  ),
                  Positioned(
                      bottom: -18,
                      child: controller.thereIsImage
                          ? Container(
                              width: 110,
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.file(
                                controller.image!,
                                fit: BoxFit.cover,
                              ))
                          : const Icon(
                              Icons.person,
                              size: 110,
                              color: Colors.white,
                            )), // if(have image) Image.assets : Icon(person)
                ],
              ),
            ),
            Positioned(
                bottom: 2,
                right: 1,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.red,
                        child: Column(
                          children: [
                            ProfileSettingsIcon(
                                icon: Icons.abc,
                                title: 'choose from galary',
                                onTap: () {
                                  controller.pickImageFromGalary(context);
                                }),
                            ProfileSettingsIcon(
                                icon: Icons.abc,
                                title: 'choose from Camera',
                                onTap: () {
                                  controller.pickImageFromCamera(context);
                                }),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
