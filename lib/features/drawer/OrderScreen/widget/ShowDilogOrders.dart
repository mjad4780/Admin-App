import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/drawer/OrderScreen/logic/cubit/orders_cubit.dart';

import 'package:flutter/material.dart';

import '../../../../utility/constants.dart';

void showOrderForm(BuildContext context, Widget widget) {
  var getorders = context.read<OrdersCubit>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: getorders,
        child: AlertDialog(
            backgroundColor: bgColor,
            title: Center(
                child: Text('Order Details'.toUpperCase(),
                    style: const TextStyle(color: primaryColor))),
            content: widget),
      );
    },
  );
}
