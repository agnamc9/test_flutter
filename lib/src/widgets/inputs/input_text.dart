import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;

  const InputText({
    super.key,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.w),
          borderSide: BorderSide(color: Colors.black, width: 2.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.w),
          borderSide: BorderSide(color: Color(0xffBABABA)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.w),
          borderSide: BorderSide(color: Color(0xffBABABA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.w),
          borderSide: BorderSide(color: Colors.black, width: 0.5.w),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
