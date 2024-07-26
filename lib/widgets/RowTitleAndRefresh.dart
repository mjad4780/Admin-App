import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utility/constants.dart';

class RowTitleAndRefresh extends StatelessWidget {
  const RowTitleAndRefresh(
      {super.key, required this.text, this.addonPressed, this.refresh});
  final String text;
  final void Function()? addonPressed;
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
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding,
            ),
          ),
          onPressed: addonPressed,
          icon: const Icon(Icons.add),
          label: const Text("Add New"),
        ),
        const Gap(20),
        IconButton(onPressed: refresh, icon: const Icon(Icons.refresh)),
      ],
    );
  }
}
