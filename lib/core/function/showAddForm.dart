import 'package:flutter/material.dart';

import '../../utility/constants.dart';

void showAddForm(BuildContext context, String? text, Widget? widget) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: bgColor,
          title: Center(
              child: Text(text!.toUpperCase(),
                  style: TextStyle(color: primaryColor))),
          content: widget);
    },
  );
}
