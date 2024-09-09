import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/const/constColors.dart';
import 'package:tiktok_clone/const/constStyle.dart';

class Authbutton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const Authbutton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Buttoncolor,
        ),
        child: Center(
            child: Text(
          text,
          style: subheadingStyle,
        )),
      ),
    );
  }
}
