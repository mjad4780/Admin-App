import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utility/constants.dart';

class RowBotttomAdd extends StatelessWidget {
  const RowBotttomAdd({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: secondaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the popup
          },
          child: Text('Cancel'),
        ),
        Gap(defaultPadding),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
          ),
          onPressed: onPressed,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
