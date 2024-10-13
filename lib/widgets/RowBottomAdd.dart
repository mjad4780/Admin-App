import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utility/constants.dart';

class RowBotttomAdd extends StatelessWidget {
  const RowBotttomAdd({super.key, this.onPressed, this.loading = false});
  final void Function()? onPressed;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: MediaQuery.sizeOf(context).width >= 450
          ? Axis.vertical
          : Axis.horizontal,
      child: Row(
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
            child: const Text('Cancel'),
          ),
          const Gap(defaultPadding),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: primaryColor,
            ),
            onPressed: onPressed,
            child: loading == true
                ? const CircularProgressIndicator()
                : const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
