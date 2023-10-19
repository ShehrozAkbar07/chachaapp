import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatefulWidget {
  final String button_text;
  final FontWeight fontWeight;
  final Color colors;
  const Button(
      {super.key,
      required this.button_text,
      required this.colors,
      required this.fontWeight});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: widget.colors),
      child: Center(
        child: Text(
          widget.button_text,
          style: TextStyle(
            fontSize: 21.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
