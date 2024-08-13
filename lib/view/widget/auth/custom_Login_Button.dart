// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  Function() onPress;
  String ButtonText;
  IconData? icon;
  CustomLoginButton({
    super.key,
    this.icon,
    required this.onPress,
    required this.ButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // Color.fromRGBO(34, 44, 56, 1),
              Color.fromRGBO(0, 153, 255, 1),
              Color.fromRGBO(0, 204, 153, 1),
              Color.fromRGBO(0, 211, 88, 1),
              // Color.fromRGBO(34, 44, 56, 1),
            ]),
      ),
      child: MaterialButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        // color: Colors.teal,
        height: 54,
        minWidth: 360,
        highlightColor: const Color.fromRGBO(0, 204, 153, 1),
        splashColor: const Color.fromRGBO(0, 204, 153, 1),
        child: Stack(
          children: [
            Icon(icon),
            Center(
              child: Text(
                ButtonText,
                style: const TextStyle(
                  color: Color.fromRGBO(34, 44, 56, 1),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
