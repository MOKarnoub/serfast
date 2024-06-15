import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocalAppBar extends StatelessWidget {
  const MyLocalAppBar({super.key});

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () 
        {
          Get.back();
        },
        icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          )),
      Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_outlined,
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
                size: 20,
            )),
          ],
        )
      ],
    );
  }
}