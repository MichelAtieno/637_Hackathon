import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final List<String> items;

  const CustomDropDownMenu({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? selectedItem;
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedItem,
          hint: Text(widget.hintText),
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue;
            });
          },
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
