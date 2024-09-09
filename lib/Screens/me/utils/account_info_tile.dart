import 'package:flutter/material.dart';

class AccountInfoTile extends StatelessWidget {
  final String input;
  final String titletext;
  final Function() ontap;
  const AccountInfoTile(
      {super.key,
      required this.input,
      required this.titletext,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(titletext), Text(input)],
      ),
    );
  }
}
