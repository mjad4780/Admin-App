import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/PosterScreen/logic/cubit/cubit/posters_cubit.dart';

import '/../../utility/constants.dart';

void showAddForm(BuildContext context, String? text, Widget? widget) {
  var getcategories = context.read<PostersCubit>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: getcategories,
        child: AlertDialog(
            backgroundColor: bgColor,
            title: Center(
                child: Text(text!.toUpperCase(),
                    style: const TextStyle(color: primaryColor))),
            content: widget),
      );
    },
  );
}
