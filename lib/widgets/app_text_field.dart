import 'package:flutter/material.dart';
import 'package:vortex/constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText; 
  const AppTextField({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide( 
            style: BorderStyle.none
            )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        // floatingLabelStyle: TextStyle( color: Colors.red),
        labelStyle: TextStyle( color: Colors.white, fontWeight: FontWeight.w500),
        fillColor: Colors.transparent,
        filled: true
      ),
    );
  }
}