// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class CustomSignupPasswordTf  extends StatelessWidget {
  TextEditingController? mycontroller;
  TextInputType? textInputType ;
  String? hint;
  String? label;
  String? countertext;
  IconData? preFixIcon;
  IconData? sufFixIcon;
  void Function() onTapForget;
  void Function() onTapIcon;
  final String? Function (String?)?myvalidator;
  bool isobscure=false;
  CustomSignupPasswordTf({
    super.key,
    this.hint,
    this.countertext,
    this.preFixIcon,
    this.sufFixIcon,
    this.textInputType,
    required this.mycontroller,
    this.label,
    required this.myvalidator,
    required this.isobscure,
    required this.onTapForget,
    required this.onTapIcon,
    });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: ".",
      obscureText: isobscure,
      validator: myvalidator,          
      cursorColor: Colors.white,
      controller: mycontroller,
      keyboardType: textInputType,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: InputDecoration(
        counterText: " ",
        counter:InkWell(onTap: onTapForget,child: 
        Text("$countertext"),
        ) ,
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
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              sufFixIcon,
              color: Colors.white60,
            ),
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