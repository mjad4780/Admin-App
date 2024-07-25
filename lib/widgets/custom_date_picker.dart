import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  final void Function() onDateSelected;

  const CustomDatePicker({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.onDateSelected,
  }) : super(key: key);

  // void _selectDate(BuildContext context) async {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        readOnly: true,
        onTap: onDateSelected,
      ),
    );
  }
}