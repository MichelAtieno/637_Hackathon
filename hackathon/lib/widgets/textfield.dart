import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.label,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          label: Text(label),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
