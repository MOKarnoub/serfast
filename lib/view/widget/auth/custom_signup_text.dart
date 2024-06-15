
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomSignupText extends StatelessWidget {
  String? question;
  @override
  Key? key;
  String? Login_or_Signup;
  final void Function() ONtap;
  CustomSignupText({
    super.key,
    this.question,
    this.Login_or_Signup,
    required this.ONtap,
    });

  @override
  Widget build(BuildContext context) {
    return
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$question",
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                ),
                ),
                InkWell(
                  onTap: ONtap ,
                  child: Text("$Login_or_Signup",
                  style: const TextStyle(
                    color: Color.fromRGBO(0,204,153, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ],
            ),
          );
  }
}