import 'package:datn_test/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/widgets/widgets.dart';

class RoundedInputField extends StatelessWidget {
  RoundedInputField(
      {Key? key,
      this.hintText,
      this.icon = Icons.person,
      required this.controller})
      : super(key: key);
  final String? hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(),
            border: InputBorder.none),
      ),
    );
  }
}
