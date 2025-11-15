import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/dashboard_cubit.dart';

class ApproveItems extends StatefulWidget {
  const ApproveItems({super.key});

  @override
  State<ApproveItems> createState() => _ApproveItemsState();
}

class _ApproveItemsState extends State<ApproveItems> {
  approveitems(String value) {
    setState(() {
      context.read<DashboardCubit>().active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            title: const Text('hide'),
            value: '0',
            groupValue: context.read<DashboardCubit>().active,
            onChanged: (String? value) {
              approveitems(value!);
            }),
        RadioListTile(
            title: const Text('active'),
            value: '1',
            groupValue: context.read<DashboardCubit>().active,
            onChanged: (String? value) {
              approveitems(value!);
            }),
      ],
    );
  }
}
