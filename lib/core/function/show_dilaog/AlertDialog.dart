import 'package:flutter/material.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';

void showSuccessDialog(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Congratulations, you have successfully!'),
            ],
          ),
        ),
        actions: const <Widget>[
          // TextButton(
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Colors.blue,
          //     disabledForegroundColor: Colors.grey.withOpacity(0.38),
          //   ),
          //   child: const Text('Continue'),
          // ),
        ],
      );
    },
  );
}

Future<bool> showMyDialog(
    BuildContext context, String title, String body) async {
  showDialog(
    context: context,
    // barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // backgroundColor: Colors.white,
        // elevation: 10,
        // scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(body),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'cancel',
            ),
            onPressed: () {
              context.pop();
            },
          ),
          TextButton(
            child: const Text(
              'Approve',
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      );
    },
  );
  return Future.value(false);
}
