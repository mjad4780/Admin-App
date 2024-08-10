// How to show the popup
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';

import '../../../../utility/constants.dart';

void showAddProductForm(BuildContext context, Widget widget) {
  var get = context.read<DashboardCubit>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: get,
        child: AlertDialog(
          backgroundColor: bgColor,
          title: Center(
              child: Text('Add Product'.toUpperCase(),
                  style: const TextStyle(color: primaryColor))),
          content: widget,
        ),
      );
    },
  );
}
