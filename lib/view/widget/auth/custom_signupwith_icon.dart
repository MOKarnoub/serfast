// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomSignupwithIcon extends StatelessWidget {
  IconData icon;
    CustomSignupwithIcon({
    super.key,
    required this.icon,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
             padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child:  Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Color.fromRGBO(34, 44, 56, 1),
                        Color.fromRGBO(0,153,255, 1),
                        Color.fromRGBO(0,204,153, 1),
                        Color.fromRGBO(0,211,88, 1),
                        // Color.fromRGBO(34, 44, 56, 1),
                      ]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: IconButton(
                    onPressed: (){}, 
                    icon: Icon(icon),
                    color: const Color.fromRGBO(34, 44, 56, 1),
                    )
                  ),
                );
  }
}