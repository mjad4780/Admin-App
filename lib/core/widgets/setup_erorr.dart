import 'package:flutter/material.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';

setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        // style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            'Got it',
            // style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}
