import 'package:flutter/material.dart';

class FormRow extends StatelessWidget {
  const FormRow({
    super.key,
    required this.text,
    required this.widget,
  });
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: Text(text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          Expanded(flex: 2, child: widget),
        ],
      ),
    );
  }
}
