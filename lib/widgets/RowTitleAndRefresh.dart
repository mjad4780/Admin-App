import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utility/constants.dart';

class RowTitleAndRefresh extends StatelessWidget {
  const RowTitleAndRefresh(
      {super.key, required this.text, this.AddonPressed, this.refresh});
  final String text;
  final void Function()? AddonPressed;
  final void Function()? refresh;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding,
            ),
          ),
          onPressed: AddonPressed,
          icon: Icon(Icons.add),
          label: Text("Add New"),
        ),
        Gap(20),
        IconButton(onPressed: refresh, icon: Icon(Icons.refresh)),
      ],
    );
  }
}
