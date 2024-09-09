import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/constColors.dart';

class Authfeilds extends StatelessWidget {
  final String hinttext;
  final bool obscure;
  final TextEditingController controller;
  const Authfeilds(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: hinttext,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: foregroundcolor))),
    );
  }
}
