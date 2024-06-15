import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String imageurl;
  final void Function() onPressed;
  const CustomIconButton
    ({
    super.key,
    required this.imageurl,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 37,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageurl),
          fit: BoxFit.cover
          ),
        borderRadius: BorderRadius.circular(37)
      ),
      child: MaterialButton(
        onPressed: onPressed
        ),
    );
  }
}
