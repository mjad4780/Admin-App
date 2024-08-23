import 'package:untitled/core/get_it/get_it.dart';

import 'logic/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/constants.dart';

import 'widget/view_dashbord/get_dashbord_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (context) => getIt<DashboardCubit>()..viewashboard(),
        child: const SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: DasboardBlocBuilder(),
        ),
      );
    });
  }
}
