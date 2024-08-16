import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

snacPar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

topsnackbar(BuildContext context, String text) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: text,
    ),
  );
}
