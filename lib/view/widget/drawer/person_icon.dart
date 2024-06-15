import 'package:flutter/material.dart';

class PersonIcon extends StatelessWidget {
  const PersonIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 110,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(52), color: Colors.grey),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 110,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(52), color: Colors.grey),
          ),
          const Positioned(
            bottom: -18,
            child: Icon(
              Icons.person,
              size: 110,
              color: Colors.white,
            ),
          ), // if(have image) Image.assets : Icon(person)
        ],
      ),
    );
  }
}
