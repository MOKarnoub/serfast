import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/view/widget/drawer/person_icon.dart';

class TopSection extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  const TopSection(
      {super.key, required this.userName, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.profileScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondary.withOpacity(0.65),
              Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
              Theme.of(context).colorScheme.surface.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.5, 0.9],
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
          child: Column(
            children: [
              const PersonIcon(),
              const SizedBox(
                height: 12,
              ),
              Text(
                userName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                phoneNumber,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
