import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlainButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const PlainButton(
    this.text, {
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.w),
        ),
        padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 12.w),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
