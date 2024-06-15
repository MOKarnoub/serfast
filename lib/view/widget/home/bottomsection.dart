import 'package:flutter/material.dart';
import 'package:serfast0_1/controller/home_controller.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
    required this.controller,
    required this.marginFromUp,
  });

  final double marginFromUp;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20, right: 10, left: 10),
    );
  }
}
