import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
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
      ),
      elevation: 0,
      centerTitle: true,
      title: Text("SerFast", style: Theme.of(context).textTheme.bodyMedium),
      leading: IconButton(
        // --------------------------- Person Icon -----------------------------------
        icon: const Icon(
          Icons.account_circle_outlined,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          Get.toNamed(AppRoute.profileScreen);
        },
      ),
    );
  }
}
