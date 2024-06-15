// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class CustomSignupTf extends StatelessWidget {
  TextEditingController? mycontroller;
  TextInputType? textInputType ;
  String? hint;
  String? label;
  IconData? preFixIcon;
  IconData? sufFixIcon;
  final String? Function (String?)?myvalidator;
  CustomSignupTf({
    super.key,
    this.hint,
    this.preFixIcon,
    this.sufFixIcon,
    this.textInputType,
    this.mycontroller,
    this.label,
    required this.myvalidator,
    });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: myvalidator,          
      cursorColor: Colors.white,
      controller: mycontroller,
      keyboardType: textInputType,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(0,153,255, 0.06),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none
          ),
          contentPadding: const EdgeInsets.symmetric(vertical:16,horizontal: 10),
          prefixIcon: Icon(
            preFixIcon,
            color: Colors.white60,
          ),
          suffixIcon: Icon(
            sufFixIcon,
            color: Colors.white60,
          ), 
          label: Container(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text("$label",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white60,
            fontFamily: 'OpenSans',
        )
      ),
    );
  }
}