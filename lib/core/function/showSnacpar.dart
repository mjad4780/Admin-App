import 'package:flutter/material.dart';

showMyDialog2(BuildContext context, String text, String s) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(text));
    },
  );
}
